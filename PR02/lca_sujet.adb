with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with LCA;

procedure LCA_Sujet is

	package LCA_String_Integer is
		new LCA (T_Cle => Unbounded_String, T_Donnee => Integer);
	use LCA_String_Integer;

Liste : T_LCA;

    procedure Afficher(Cle : in Unbounded_String; Donnee: in Integer) is
    begin
        Put(To_String(Cle));
        Put_Line((Integer'Image(Donnee)));
    end Afficher;

procedure Pour_Chaque_Afficher is new Pour_Chaque(Traiter => Afficher);
begin
    Initialiser(Liste);
    Enregistrer(Liste, To_Unbounded_String("un"), 1);
    Enregistrer(Liste, To_Unbounded_String("deux"), 2);
    Pour_Chaque_Afficher(Liste);
end LCA_Sujet;