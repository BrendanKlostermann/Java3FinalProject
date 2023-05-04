package FanQuestionDAO_CSV;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FanQuestionDAO_CSV {
    public static List<FanQuestion> getAllFanQuestion(HttpServletRequest request, HttpServletResponse response){
        List<FanQuestion> fanQuestions = new ArrayList<>();
        try(Scanner scanner = new Scanner(new File(request.getServletContext().getRealPath("/WEB-INF/PokemonCSV/fanQuestions.csv")))){
            int rowCount = 0;
            while(scanner.hasNextLine()){
                String[] line = scanner.nextLine().split(",");
                if(rowCount <= 1){
                    rowCount++;
                }
                if(rowCount != 1){
                    int questionID = Integer.parseInt(line[0]);
                    String question = line[1];
                    String option1 = line[2];
                    String option2 = line[3];
                    String option3 = line[4];
                    String option4 = line[5];
                    String answer = line[6];
                    String email = line[7];

                    fanQuestions.add(new FanQuestion(questionID, question, option1, option2, option3, option4, answer, email));
                }
            }
        }catch (FileNotFoundException up){
            System.out.println("File not found");
        }
        return fanQuestions;
    }


    public void appendToCSV(ServletContext context, String fileName, String[] rowData) throws IOException {
        // Construct the full file path
        String filePath = context.getRealPath("/") + fileName;

        // Read the last ID from the CSV file
        int lastID = 0;
        if (Files.exists(Paths.get(filePath))) {
            try {
                String lastLine = Files.readAllLines(Paths.get(filePath)).get(Files.readAllLines(Paths.get(filePath)).size() - 1);
                String[] parts = lastLine.split(",");
                lastID = Integer.parseInt(parts[0]);
            } catch (IOException e) {
                e.printStackTrace();
                throw e;
            }
        }
        int newID = lastID + 1;

        FileWriter fileWriter = new FileWriter(filePath, true);
        BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);

        // Write the new data to the CSV file
        bufferedWriter.write(newID + ",");
        for (int i = 0; i < rowData.length; i++) {
            bufferedWriter.write(rowData[i]);
            if (i < rowData.length - 1) {
                bufferedWriter.write(",");
            }
        }
        bufferedWriter.newLine();

        // Close the file
        bufferedWriter.flush();
        bufferedWriter.close();
        fileWriter.close();
    }
}
