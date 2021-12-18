                                                                                                    
(defun conditions (recette)                  ;Retourne les conditions d'une recette, donc ses ingrédients et ses caracteristiques     
  (cadr (assoc recette BR_Recette))  )

;Tests
(conditions 'margarita)





(defun TestValidity (recette)
  (let ((cond (conditions recette)))
    (dolist (x cond)                                              ; on parcours tous les elements conditions de la recette
      (if ( OR (eq (car x) 'petillant ) (eq (car x) 'fruite ) )   ; Si l'element est la caracteristique petillant ou fruite
          (if (eq (TestValidityBool x) NIL)
              (return-from TestValidity NIL))
                                                                  ; L'element est soit un ingerdient soit difficulte, ou nv_alcoolemie,
          (if (NOT (assoc (car x) BF))                            ; On verifie que si l'element est dans la base de fait 
               (return-from TestValidity NIL)                                    ; L'element n'est pas dans la base de fait valid devient nil
               (if (< (cadr (assoc (car x) BF))(cadr x))           ; on cherche si la quantité du placard est < à la quantité demandé dans la recette
                   (return-from TestValidity NIL))
            )))
      (return-from TestValidity t)
    ))

;Test
(TestValidity 'punch)
(TestValidity 'cocktail_du_pauvre1)
(TestValidity 'cocktail_du_pauvre2)
(TestValidity 'planters_punch)
(TestValidity 'cocktail_du_pauvre3) ;; ---> FAUX 

;;Si on a les attributs fruite et petillant il suffit de regarder si testValidityBool renvoi true et on continue, si renvoi false on arret 
;;Si non il suffit de regarder si le deuxieme argument de la sous liste de la recette est >= a l'equivalent dans la base de fait     





(defun TestValidityBool (x)
  (if (OR (eq (cadr (assoc (car x) BF)) (cadr x))
      (eq -1 (cadr (assoc (car x) BF))))                      ;Si le caractere petillant est == de celui demandé par l'utilisateur, ou si celui de l'utilisateur est == - 1              
            (return-from TestValidityBool t))
  (return-from TestValidityBool NIL))

;Test
(TestValidityBool '(petillant 1))      ;Retourne t si dans la BF on a (petillant 1) ou (petillant -1)




(defparameter RecettesPossibles NIL)

(defun RecettesValides ()
    (dolist (recette BR_Recette) ;;On parcours toutes les recettes de notre base de règle
      (if (TestValidity (car recette))
          (push recette RecettesPossibles)))
  RecettesPossibles)
;Strategie de chainage avant 

;Test
(RecettesValides)


    
