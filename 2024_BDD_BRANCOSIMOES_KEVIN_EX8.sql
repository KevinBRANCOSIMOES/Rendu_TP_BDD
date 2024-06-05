CREATE TABLE Disponibilite(
   id_disponibilite INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   date_debut VARCHAR(50) NOT NULL,
   date_fin VARCHAR(50) NOT NULL,
   id_materiel INT NOT NULL,
   FOREIGN KEY(id_materiel) REFERENCES Materiel(id_materiel)
);

ALTER TABLE reservation ADD COLUMN id_disponibilite INT;
ALTER TABLE reservation ADD CONSTRAINT contraite_id_disponibilite FOREIGN KEY(id_disponibilite) REFERENCES disponibilite(id_disponibilite);