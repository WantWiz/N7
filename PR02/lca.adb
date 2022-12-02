--with Ada.Text_IO;            use Ada.Text_IO;
with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Unchecked_Deallocation;

package body LCA is

	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);


	procedure Initialiser(Sda: out T_LCA) is
	begin
		Sda := null;
	end Initialiser;


	function Est_Vide (Sda : T_LCA) return Boolean is
	begin
		if Sda = null then
	
			return True;
		else
			return False;
		end if;
	end;


	function Taille (Sda : in T_LCA) return Integer is
	Sda_temp : T_LCA;
	Compteur : Integer;

	begin
		Compteur := 0;
		Sda_temp := Sda;
		while Sda_temp /= null loop
			Compteur := Compteur + 1;
			Sda_temp := Sda_temp.all.Suivant;
			
		end loop;
		return Compteur;
	end Taille;


	procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Donnee : in T_Donnee) is


	begin
		if Est_Vide(Sda) then
    			Sda := new T_Cellule'(Cle, Donnee,null);

		elsif Sda.all.Cle = Cle then
			Sda.all.Donnee := Donnee;
		else
			Enregistrer(Sda.all.Suivant, Cle, Donnee);
		end if;

		
	end Enregistrer;


	function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
	Present : Boolean;
	begin
		Present := False;
		if Est_Vide(Sda) then
			null;
		elsif Sda.all.Cle = Cle then
			Present := True;
		else
			Present := Cle_Presente(Sda.all.Suivant, Cle);
		end if;
		return Present;
	end Cle_Presente;


	function La_Donnee (Sda : in T_LCA ; Cle : in T_Cle) return T_Donnee is
	LaDonnee : T_Donnee;
	begin

		if Est_Vide(Sda) then
			raise Cle_Absente_Exception;
		elsif Sda.all.Cle = Cle then
			LaDonnee := Sda.all.Donnee;
		else
			LaDonnee := La_Donnee(Sda.all.Suivant, Cle);
		end if;
		return LaDonnee;
	end La_Donnee;


	procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
	Temp : T_LCA;
	begin

		if Est_Vide(Sda) then
			raise Cle_Absente_Exception;
		elsif Sda.all.Cle = Cle then
            Temp := Sda.all.Suivant;
            Free(Sda);
            Sda := Temp;
		else
			Supprimer(Sda.all.Suivant, Cle);
		end if;
	end Supprimer;


	procedure Vider (Sda : in out T_LCA) is
	Temp : T_LCA;
	begin
		if Est_Vide(Sda) then
		
			null;
		else
        	Temp := Sda.all.Suivant;
            Free(Sda);
            Sda := Temp;
            Vider(Sda);
		end if;
	end Vider;


	procedure Pour_Chaque (Sda : in T_LCA) is
	begin
		if Est_Vide(Sda) then
			null;
		else
			begin
				Traiter(Sda.all.Cle, Sda.all.Donnee);
			exception
				when others => null;
			end;
			Pour_Chaque(Sda.all.Suivant);
		end if;
	end Pour_Chaque;


end LCA;
