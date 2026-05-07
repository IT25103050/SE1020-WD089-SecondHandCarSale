package com.carplatform.util;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * FileHandler utility class.
 * Handles all TXT file read/write operations.
 * Creates files and directories if they do not exist.
 */
public class FileHandler {

    /**
     * Reads all lines from a TXT file.
     * If the file does not exist, creates it and returns an empty list.
     * Skips blank lines.
     */
    public static List<String> readAllLines(String filePath) {
        List<String> lines = new ArrayList<>();
        File file = new File(filePath);

        // Create parent directories and file if they do not exist
        try {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            if (!file.exists()) {
                file.createNewFile();
                return lines; // Return empty list for new file
            }
        } catch (IOException e) {
            e.printStackTrace();
            return lines;
        }

        // Read file line by line
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Skip blank lines
                if (!line.trim().isEmpty()) {
                    lines.add(line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return lines;
    }

    /**
     * Writes all lines to a TXT file (overwrites existing content).
     * Creates the file and parent directories if they do not exist.
     */
    public static void writeAllLines(String filePath, List<String> lines) {
        File file = new File(filePath);

        try {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
