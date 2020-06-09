//
//  CrearCursoViewController.swift
//  Course
//
//  Created by mbtec22 on 6/8/20.
//  Copyright © 2020 Tecsup. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var txtNombreCurso: UITextField!
    @IBOutlet weak var txtPromPra: UITextField!
    @IBOutlet weak var txtPromLab: UITextField!
    @IBOutlet weak var txtExamen: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func agregar(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let curso = Curso(context: context)
        curso.nombre = txtNombreCurso.text!
        curso.prom_pra = txtPromPra.text!
        curso.prom_lab = txtPromLab.text!
        curso.examen = txtExamen.text!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    
}
