package com.carplatform.util;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {

    /**
     * Reads all lines from a file and returns them as a List.
     * Skips blank lines.
     */
    public static List<String> readAllLines(String filePath) {
        List<String> lines = new ArrayList<>();
        ensureFileExists(filePath);

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    lines.add(line.trim());
                }
            }
        } catch (IOException e) {
            System.out.println("FileHandler - Error reading file: " + filePath);
            e.printStackTrace();
        }

        return lines;
    }

    /**
     * Appends a single line to the end of a file.
     */
    public static void writeLine(String filePath, String line) {
        ensureFileExists(filePath);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            System.out.println("FileHandler - Error writing to file: " + filePath);
            e.printStackTrace();
        }
    }

    /**
     * Overwrites the entire file with the given list of lines.
     * Used when updating or deleting records.
     */
    public static void overwriteFile(String filePath, List<String> lines) {
        ensureFileExists(filePath);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("FileHandler - Error overwriting file: " + filePath);
            e.printStackTrace();
        }
    }

    /**
     * Creates the file and its parent directories if they do not exist.
     */
    public static void ensureFileExists(String filePath) {
        File file = new File(filePath);
        try {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            System.out.println("FileHandler - Error creating file: " + filePath);
            e.printStackTrace();
        }
    }
}
