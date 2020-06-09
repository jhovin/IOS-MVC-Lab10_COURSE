
import UIKit

class DetalleCursoViewController: UIViewController {
    
  
    @IBOutlet weak var cursoLabel: UILabel!
    @IBOutlet weak var promPracLabel: UILabel!
    @IBOutlet weak var promLabLabel: UILabel!
    @IBOutlet weak var examLabel: UILabel!
    var curso : Curso? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if curso != nil{
            cursoLabel.text = "\(curso!.nombre!)"
            promPracLabel.text = "\(curso!.prom_pra!)"
            promLabLabel.text = "\(curso!.prom_lab!)"
            examLabel.text = "\(curso!.examen!)"
        }else{
            cursoLabel.text = curso!.nombre!
            promPracLabel.text = curso!.prom_pra!
            promLabLabel.text = curso!.prom_lab!
            examLabel.text = curso!.examen!
        
        }
    }
       
}

