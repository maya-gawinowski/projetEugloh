//
//  ViewController.swift
//  ProtoypeDataBase
//
//  Created by Maya Gawinowski on 10/04/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialisation de la base de donnée
        let db = Firestore.firestore()
        
        // Lecture de la collection users
        db.collection("users").getDocuments { (querySnapshot, error) in
            if error == nil && querySnapshot != nil {
                // on parcourt tous les documents dans la collection users
                for doc in querySnapshot!.documents {
                    // on affiche l'id de chaque document
                    print(doc.documentID)
                }
                
            }
        }
        
        // Effacer un utilisateur de la collection user
        db.collection("users").document("AEji8bkewxK8smeVfqsE").delete()
        
        // Lecture de données en fonction d'une requete
        // retourne la liste des documents qui ont "maya.gawinowski@universite-paris-saclay" pour le field "email"
        db.collection("users").whereField("email", isEqualTo: "maya.gawinowski@universite_paris_saclay.fr").getDocuments { (querySnapshot, error) in
            if error == nil && querySnapshot != nil {
                let docs = querySnapshot!.documents // on récupère les documents
                for doc in docs{ // pour chaque document dans la liste docs
                    print(doc.documentID) // on affiche l'identifiant des documents
                }
            }
        }
    }


}

