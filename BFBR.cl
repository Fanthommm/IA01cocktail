(defparameter BF '((gin 50) (rhum 30) (rape 1) (jus_orange 8) (citron 10) (sirop_grenadine 10) (citron 4) (sirop_citron 10) (vodka 6) (eau 400) (tonic 20) (orange 3)  (sirop_sucre 2) (limonade 10) (difficulte 2) (presse 1) (petillant 0) (fruite -1) (niveau_alcoolemie 3)))

(defparameter BR_Recette '(
                (perroquet ((sirop_menthe 2) (ricard 4) (eau 8) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
                (punch ((sirop_sucre 2) (rhum 5) (citron 1) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (pina_colada ((lait_coco 4) (rhum 6) (jus_ananas 12) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (mojito ((rhum 5) (menthe 7) (jus_citron 1) (sucre 10) (difficulte 5) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
                (cocktail_du_pauvre1 ((vodka 13) (sirop_citron 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3)))
                (cocktail_du_pauvre2 ((vodka 13) (sirop_grenadine 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3)))
                (cocktail_du_pauvre3 ((vodka 13) (sirop_menthe 6) (eau 14) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 3)))
                (cocktail_du_pauvre4 ((vodka 13) (sirop_violette 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3)))
                (cocktail_du_pauvre5 ((vodka 13) (sirop_fraise 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3)))
                (vodka_martini ((olive 1) (vodka 6) (martini 1) (zeste_citron 3) (difficulte 4) (petillant 0) (fruite 0) (niveau_alcoolemie 3)))
                (margarita ((tequila 4) (triple_sec 2) (jus_citron 2) (difficulte 2) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
                (souple_champenoise ((champagne 25) (triple_sec 5) (sucre 5) (jus_citron 5) (difficulte 3) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (aperol_spritz ((aperol 4) (prosecco 5) (tonic 2) (orange 1) (difficulte 2) (petillant 1) (fruite 1) (niveau_alcoolemie 2)))
                (martini_prosecco ((prosecco 5) (citron 1) (martini 5) (difficulte 3) (petillant 0) (fruite 1) (niveau_alcoolemie 3)))
                (martini_grenadine ((sirop_grenadine 2) (martini 6) (tonic 10) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 1)))
                (bloody_mary ((vodka 3) (sel 1) (poivre 1) (sauce_worcester 1) (jus_tomate 6) (jus_citron 1) (tabasco 1) (difficulte 4) (petillant 0) (fruite 0) (niveau_alcoolemie 1)))
                (cocktail_tomate ((ricard 4) (eau 8) (sirop_grenadine 2) (difficulte 2) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (mauresque ((ricard 4) (sirop_orgeat 2) (eau 8) (difficulte 2) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
                (gin_tonic ((gin 5) (tonic 20) (zeste_orange 2) (difficulte 4) (petillant 1) (fruite 0) (niveau_alcoolemie 1)))
                (cosmopolitan ((jus_cramberry 2) (vodka 4) (jus_citron 1) (triple_sec 2) (difficulte 2) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (shot_piquant ((tabasco 1) (vodka 2) (sirop_grenadine 2) (difficulte 2) (petillant 0) (fruite 1) (niveau_alcoolemie 3)))
                (jager_bomb ((jager 5) (redbull 15) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
                (tequila_rose ((tequila 2) (sirop_fraise 2) (lait 6) (citron 1) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 1)))
                (whisky_coca ((coca 7) (whisky 5)(difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
                (whisky_tonic  ((whisky 4) (tonic 15) (difficulte 1) (petillant 1) (fruite 0) (niveau_alcoolemie 2)))
                (teq_paf ((tequila 3) (citron 1) (sel 1) (difficulte 2) (petillant 0) (fruite 0) (niveau_alcoolemie 3)))
                (tequila_sunrise ((tequila 6) (jus_orange 20) (sirop_grenadine 2) (orange 1) (difficulte 3) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (sex_on_the_beach  ((jus_ananas 6) (vodka 3) (liqueur_peche 3) (jus_cranberry 10) (difficulte 2) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (planters_punch ((rhum 6) (jus_citron 2) (jus_orange 2) (sirop_grenadine 1) (difficulte 2) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (shot_get ((get27 5) (eau_gazeuze 5) (difficulte 1) (petillant 1) (fruite 0) (niveau_alcoolemie 2)))          
                (melon_ball ((jus_ananas 6) (vodka 6) (jus_citron 2) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (washington_apple  ((jus_pomme 5) (whisky 6) (jus_cranberry 6) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))
                (orgasm ((baileys 6) (lait 6) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
                (cocktail_rio ((jus_orange 5) (limonade 5) (sirop_grenadine 1) (citron 1) (difficulte 2) (petillant 1) (fruite 1) (niveau_alcoolemie 0)))            
                (cocktail_couleur ((framboise 2) (jus_framboise 5) (citron 1) (eau 10) (sirop_sucre 2) (menthe 1) (zeste_orange 2) (difficulte 3) (petillant 0) (fruite 1) (niveau_alcoolemie 0)))        
                (cocktail_mamie ((jus_orange 5) (sirop_grenadine 2) (glacon 5) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 0)))          
                ))


(defparameter BR_Ingredient_Similaires '(
                (jus_citron  ((citron 2) (jus_ananas 1)(jus_pomme 1)(jus_orange 1) (sirop_citron 1)))
                (jus_ananas  ((ananas 1) (jus_citron 1)(jus_pomme 1)(jus_orange 1)))     
                (jus_pomme  ((pomme 3) (jus_citron 1)(jus_ananas 1)(jus_orange 1))) 
                (zeste_citron ((citron 1)(zeste_orange 1)))
                (zeste_orange ((orange 1)(zeste_citron 1)))
                (jus_tomate ((tomate 2)))
                (jus_orange ((orange 2) (multifruit 1)(fanta 1)(jus_mangue 1)(jus_ananas 1)(jus_pomme 1)(jus_citron 1)))
                (tonic ((limonade 1)(swheps 1) (eau_gazeuze 1)))
                (limonade ((tonic 1)(swheps 1) (eau_gazeuze 1)))
                (shweps ((limonade 1)(tonic 1) (eau_gazeuze 1)))
                (eau_gazeuze ((limonade 1)(swheps 1) (tonic 1)))
                (rhum ((vodka 1)))
                (vodka ((rhum 1)))
                (jus_framboise ((sirop_framboise 1)(jus_fraise 1) (jus_cranberry 1) (sirop_fraise 1) (sirop_violette 1) (sirop_grenadine 1)))
                (glacon ((eau_froide2)))))
                                         
;(Ingredient_a_remplacer ((Recette 1)(Recete 2)(Recette 3)))
;Ex Recette 1 : ((Ingredient1 2)(Ingredient1 3))

;Dans test Validity: 
;Si un element n'est pas dans le placard de l'utilisateur:
;On appel relacement: 
;Si il renvoi null : il n'y a aucun remplaçannt donc la recette n'est pas faisable 
;Si non il renvoi une recette, donc on rappel la fonction testValidyrecetet sur cette nouvelle recette 

;Replacement(ingredient_a_remplacer recette);
;Si il existe une regle avec cet ingredient dans la base:
;Pour chaque ingrédients remplacant possible: (faire un dolist)
;      regarder si l'utilisateur possède tous les elements de cette liste et EN BONNE QUANTITE (refaire un dolist) 
;      si oui :
;             modifier la recette passé en parametre en remplacant l'igrédient par tous les ingrédients qui la remplacent 
;             retourner la recette 
;      si non : continuer 
;si la fonction ne s'est pas arrété a cette etape c'est qu'il n'a pas trouvé de remplaçant donc on renvoit nill


