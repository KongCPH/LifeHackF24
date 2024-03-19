package app.persistence.c3;

import java.util.EnumMap;
import java.util.Map;

public class WashingInstructions {

    public enum Washing {
        MASKIN_VASK, TÅLER_IKKE_VASK, HÅNDVASK, KEMISK_RENS, KEMISK_RENSNING, TÅLER_IKKE_KEMISK_RENS, TÅLER_BLEGNING, TÅLER_IKKE_BLEGNING
    }

    public enum Drying {
        KAN_TØRRETUMBLES, KAN_IKKE_TØRRETUMBLES, KAN_STRYGES, KAN_IKKE_STRYGES
    }

    public static void washingDescriptions(String[] args){
        Map<Washing, String> washingDescriptions = new EnumMap<>(Washing.class);
        washingDescriptions.put(Washing.MASKIN_VASK, "Symbolet med vaskebaljen angiver at tøjet kan maskinvaskes, og figuren viser samtidig også den maksimale vasketemperatur, som tøjet tåler. Hvis symbolet er understreget, betyder det, at tøjet skal vaskes skånsomt. To understregninger angiver, at tøjet skal vaskes meget skånsomt.");
        washingDescriptions.put(Washing.TÅLER_IKKE_VASK, "Tåler ikke vask. Dette symbol angiver, at tøjet hverken tåler maskinvask eller håndvask.");
        washingDescriptions.put(Washing.HÅNDVASK, "Håndvask. Dette er symbolet for håndvask, og den maksimale temperatur er 40 grader. Tøjet bør ikke vrides eller skrubbes. Tjek om din vaskemaskine har et specielt program til håndvask.");
        washingDescriptions.put(Washing.KEMISK_RENS, "Et W indikerer, at tøjet tåler kemisk rens i vand. Det udføres af et professionelt vaskeri.");
        washingDescriptions.put(Washing.KEMISK_RENSNING, "Dette symbol betyder, at tøjet kun tåler kemisk rensning med petroleumsbaserede opløsningsmidler");
        washingDescriptions.put(Washing.TÅLER_IKKE_KEMISK_RENS, "Hvis tøjet har et symbol med et kryds hen over en cirkel, betyder det, at tøjet ikke tåler kemisk rens. Det må i stedet håndvaskes.");
        washingDescriptions.put(Washing.TÅLER_BLEGNING, "En hvid trekant betyder, at tøjet tåler blegning. Alle typer blegeprodukter i almindelig handel kan bruges i vaskeprocessen.");
        washingDescriptions.put(Washing.TÅLER_IKKE_BLEGNING, "Dette symbol indikerer, at blegemiddel ikke bør anvendes. Tøjet er ikke farveægte eller stærkt nok til at modstå nogen former for blegning.");
}

    public static void dryingDescriptions(String[] args) {
        Map<Drying, String> dryingDescriptions = new EnumMap<>(Drying.class);
        dryingDescriptions.put(Drying.KAN_TØRRETUMBLES, "Et symbol med hvid cirkel i en firkant betyder, at tøjet kan tørretumbles. Prikkerne angiver, hvor høj en temperatur, tøjet tåler. En prik betyder, at tøjet kun bør tørres ved lav temperatur. To prikker angiver, at tøjet kan tørretumbles ved normal temperatur.");
        dryingDescriptions.put(Drying.KAN_IKKE_TØRRETUMBLES, "Et lignende symbol men med et kryds henover betyder, at tøjet ikke tåler at blive tørretumblet. Sammen med dette symbol angives i stedet en mild metode for tørring.");
        dryingDescriptions.put(Drying.KAN_STRYGES, "Disse symboler viser, at tøjet kan stryges. Prikkerne indikerer temperaturindstillingerne. En prik betyder, at tøjet kan stryges på maks. 110 grader. To prikker betyder, at tøjet kan stryges på maks. 150 grader, og 3 prikker betyder, at tøjet kan stryges på maks. 200 grader.");
        dryingDescriptions.put(Drying.KAN_IKKE_STRYGES, "Symbolet indikerer, at tøjet ikke tåler strygning. Strygejern bør ikke bruges.");
    }

}
