drop table if exists public.instructions;

CREATE TABLE public.instructions
(
    id serial NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.instructions
    OWNER to postgres;
	
	
INSERT INTO instructions (name, description)
VALUES ('washme', 'Symbolet med vaskebaljen angiver at tøjet kan maskinvaskes, og figuren viser samtidig også den maksimale vasketemperatur, som tøjet tåler. Hvis symbolet er understreget, betyder det, at tøjet skal vaskes skånsomt. To understregninger angiver, at tøjet skal vaskes meget skånsomt.');

INSERT INTO instructions (name, description)
VALUES ('dontwash', 'Tåler ikke vask. Dette symbol angiver, at tøjet hverken tåler maskinvask eller håndvask.');

INSERT INTO instructions (name, description)
VALUES ('handwash', 'Håndvask. Dette er symbolet for håndvask, og den maksimale temperatur er 40 grader. Tøjet bør ikke vrides eller skrubbes. Tjek om din vaskemaskine har et specielt program til håndvask.');

INSERT INTO instructions (name, description)
VALUES ('chemical_w', 'Et W indikerer, at tøjet tåler kemisk rens i vand. Det udføres af et professionelt vaskeri.');

INSERT INTO instructions (name, description)
VALUES ('chemical_p', 'Dette symbol betyder, at tøjet kun tåler kemisk rensning med petroleumsbaserede opløsningsmidler');

INSERT INTO instructions (name, description)
VALUES ('nochemicals', 'Hvis tøjet har et symbol med et kryds hen over en cirkel, betyder det, at tøjet ikke tåler kemisk rens. Det må i stedet håndvaskes.');

INSERT INTO instructions (name, description)
VALUES ('canbleach', 'En hvid trekant betyder, at tøjet tåler blegning. Alle typer blegeprodukter i almindelig handel kan bruges i vaskeprocessen.');

INSERT INTO instructions (name, description)
VALUES ('dontbleach', 'Dette symbol indikerer, at blegemiddel ikke bør anvendes. Tøjet er ikke farveægte eller stærkt nok til at modstå nogen former for blegning.');

INSERT INTO instructions (name, description)
VALUES ('toerretumbler', 'Et symbol med hvid cirkel i en firkant betyder, at tøjet kan tørretumbles. Prikkerne angiver, hvor høj en temperatur, tøjet tåler. En prik betyder, at tøjet kun bør tørres ved lav temperatur. To prikker angiver, at tøjet kan tørretumbles ved normal temperatur.');

INSERT INTO instructions (name, description)
VALUES ('dontdry', 'Et lignende symbol men med et kryds henover betyder, at tøjet ikke tåler at blive tørretumblet. Sammen med dette symbol angives i stedet en mild metode for tørring.');

INSERT INTO instructions (name, description)
VALUES ('ironme', 'Disse symboler viser, at tøjet kan stryges. Prikkerne indikerer temperaturindstillingerne. En prik betyder, at tøjet kan stryges på maks. 110 grader. To prikker betyder, at tøjet kan stryges på maks. 150 grader, og 3 prikker betyder, at tøjet kan stryges på maks. 200 grader.');

INSERT INTO instructions (name, description)
VALUES ('dontironme', 'Symbolet indikerer, at tøjet ikke tåler strygning. Strygejern bør ikke bruges.');
