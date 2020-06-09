import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cursos: [Curso] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        obtenerCurso()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        cell.textLabel?.text = curso.nombre
        let n_examen = (curso.examen! as NSString).doubleValue
        
        if n_examen>=13.00{
            func tableView(_ tableView:UITableView,willDisplay cell:UITableViewCell,forRowAt indexPath: IndexPath){
                cell.backgroundColor = UIColor.green
            }
        }else if n_examen<13.00{
            func tableView(_tableView:UITableView,willDisplay cell:UITableViewCell,forRowAt indexPath: IndexPath){
                cell.backgroundColor = UIColor.red
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "detalleSegue", sender: curso)
    }
    
    @IBAction func nuevoCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerCurso(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        }catch{
            print("Ha ocurrido un error!")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalleSegue"{
            let siguienteVC = segue.destination as! DetalleCursoViewController
            siguienteVC.curso = sender as! Curso
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let curso = cursos[indexPath.row]
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(curso)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                cursos = try context.fetch(Curso.fetchRequest())
                tableView.reloadData()
            }catch{
            }
        }
    }
}

