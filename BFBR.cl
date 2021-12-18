(defparameter BF '((gin 50) (rhum 30) (rape 1) (jus_orange 4) (sirop_grenadine 10) (jus_citron 4) (sirop_citron 10) (vodka 50) (eau 400) (tonic 20) (orange 1) (citron 3) (sirop_sucre 2) (limonade 10) (difficulte 2) (petillant 0) (fruite -1) (niveau_alcoolemie 3)))

(defparameter BR_Recette '(
                (perroquet ((sirop_menthe 2) (difficulte 1) (ricard 4) (eau 8) (petillant 0) (fruite 0) (niveau_alcoolemie 2)))
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
))


(defparameter BR_Ingredient_Similaires '(
                (jus_citron  (((citron 1) (presse 1) (difficulte 1))))
                (zeste_orange (((orange 1) (rape 1) (difficulte 1))))
                (jus_tomate (((tomate 1) (mixeur 1) (difficulte 2))))
                (jus_orange (((orange 1) (difficulte 1)) (fanta 1 (difficulte 0)) (orangina 1 difficulte 0)))
                (tonic ((limonade 1) (swheps 1)))))




