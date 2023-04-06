package MyDAO_CSV;

import MyDAO_CSV.Pokemon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PokemonDAO_CSV {
    public static List<Pokemon> getAllPokemon(HttpServletRequest request, HttpServletResponse response) {
        List<Pokemon> pokemons = new ArrayList<>();
        try (Scanner scanner = new Scanner(new File(request.getServletContext().getRealPath("WEB-INF/PokemonCSV/pokemon.csv")))) {
            int rowCount = 0;
            while (scanner.hasNextLine()) {
                String[] line = scanner.nextLine().split(",");
                if (rowCount <= 1) {
                    rowCount++;
                }
                if (rowCount != 1) {
                    int pokemonID = Integer.parseInt(line[0]);
                    String pokemonName = line[1];
                    String typeOne = line[2];
                    String typeTwo = line[3];
                    int total = Integer.parseInt(line[4]);
                    int hitPoints = Integer.parseInt(line[5]);
                    int attack = Integer.parseInt(line[6]);
                    int defense = Integer.parseInt(line[7]);
                    int spAttack = Integer.parseInt(line[8]);
                    int spDefense = Integer.parseInt(line[9]);
                    int speed = Integer.parseInt(line[10]);
                    int generation = Integer.parseInt(line[11]);
                    boolean legendary = Boolean.parseBoolean(line[12]);

                    pokemons.add(new Pokemon(pokemonID, pokemonName, typeOne, typeTwo, total, hitPoints, attack, defense, spAttack, spDefense, speed, generation, legendary));
                }
            }
        } catch (FileNotFoundException up) {
            System.out.println("File not found");
        }
        return pokemons;
    }
}
