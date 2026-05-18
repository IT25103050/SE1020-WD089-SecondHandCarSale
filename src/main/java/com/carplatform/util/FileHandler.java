package com.carplatform.util;

import java.io.*;
<<<<<<< HEAD
import java.nio.file.*;
import java.util.*;
=======
import java.util.ArrayList;
import java.util.List;
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c

public class FileHandler {

    /**
<<<<<<< HEAD
     * Ensures that the specified file exists. If it does not exist,
     * creates the necessary parent directories and the empty file.
     */
    public static void ensureFileExists(String path) {
        try {
            Path filePath = Paths.get(path);
            if (!Files.exists(filePath)) {
                if (filePath.getParent() != null) {
                    Files.createDirectories(filePath.getParent());
                }
                Files.createFile(filePath);
            }
        } catch (IOException e) {
            System.err.println("Error ensuring file exists: " + e.getMessage());
        }
    }

    /**
     * Reads all lines from the specified file path.
     */
    public static List<String> readAllLines(String path) {
        ensureFileExists(path);
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = Files.newBufferedReader(Paths.get(path))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Keep useful trimmed or un-trimmed rows, ignore completely blank rows
                if (!line.trim().isEmpty()) {
                    lines.add(line);
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading lines from file: " + e.getMessage());
        }
=======
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

>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
        return lines;
    }

    /**
<<<<<<< HEAD
     * Appends a single line to the end of the specified file.
     */
    public static void writeLine(String path, String line) {
        ensureFileExists(path);
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(path), StandardOpenOption.APPEND)) {
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error writing line to file: " + e.getMessage());
=======
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
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
        }
    }

    /**
<<<<<<< HEAD
     * Overwrites the specified file entirely with the provided list of lines.
     */
    public static void overwriteFile(String path, List<String> lines) {
        ensureFileExists(path);
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(path), StandardOpenOption.TRUNCATE_EXISTING, StandardOpenOption.WRITE)) {
=======
     * Overwrites the entire file with the given list of lines.
     * Used when updating or deleting records.
     */
    public static void overwriteFile(String filePath, List<String> lines) {
        ensureFileExists(filePath);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
<<<<<<< HEAD
            System.err.println("Error overwriting file: " + e.getMessage());
=======
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
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
        }
    }
}
