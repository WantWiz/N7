#include <stdlib.h> 
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// Definition du type monnaie
struct monnaie {
    float valeur;
    char devise;
};
typedef struct monnaie monnaie;


/**
 * \brief Initialiser une monnaie 
 * \param[]
 * \pre 
 * // TODO
 */ 
void initialiser(monnaie *argent, float valeur, char devise){
    assert(valeur >= 0.0);
    (*argent).valeur = valeur;
    (*argent).devise = devise;
}


/**
 * \brief Ajouter une monnaie m2 à une monnaie m1 
 * \param[]
 * // TODO
 */ 
bool ajouter(monnaie *m1, monnaie *m2){
    // TODO
    if ((*m1).devise == (*m2).devise) {
        (*m1).valeur += (*m2).valeur;
        return true;
    }
    else {
        return false;
    }
}


/**
 * \brief Tester Initialiser 
 * \param[]
 * // TODO
 */ 
void tester_initialiser(){
    // TODO
    monnaie argent;
    initialiser(&argent, 1.0, 'e');
    assert(argent.valeur == 1.0);
    assert(argent.devise == 'e');
    printf("Le test passe\n");

}

/**
 * \brief Tester Ajouter 
 * \param[]
 * // TODO
 */ 
void tester_ajouter(){
    // TODO
    monnaie m1_euros;
    monnaie m2_euros;
    monnaie m3_livres;
    initialiser(&m1_euros, 1.0, 'e');
    initialiser(&m2_euros, 2.0, 'e');
    initialiser(&m3_livres, 3.0, 'l');
    ajouter(&m1_euros, &m2_euros);
    assert(m1_euros.valeur == 3.0);
    assert(ajouter(&m1_euros, &m3_livres) == false);
    printf("Le test passe\n");
}


#define NB 5
int main(void){
	 tester_ajouter();
	 tester_initialiser();
    // Un tableau de 5 monnaies
    struct monnaie porte_monnaie[NB];
	 float valeur;
    char devise;
    //Initialiser les monnaies
    for (int i = 0; i<NB; i++){

        printf("Valeur et devise de la monnaie %d \n", i);
        scanf("%f %c", &valeur, &devise);
        initialiser(&porte_monnaie[i], valeur, devise);
    }
 
    // Afficher la somme des toutes les monnaies qui sont dans une devise entrée par l'utilisateur.
    char devise_choisie;

    printf("Choisissez une devise à sommer : \n");

    scanf("%c", &devise_choisie);
    monnaie somme;
    initialiser(&somme, 0, devise_choisie);
    for(int i = 0; i<NB;i++){
        if (porte_monnaie[i].devise == devise_choisie){
            ajouter(&porte_monnaie[i], &somme);
        }
    }
    printf("%1.2f \n", somme.valeur);
    return EXIT_SUCCESS;
}
