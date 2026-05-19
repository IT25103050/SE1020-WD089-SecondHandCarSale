package com.carplatform.util;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public class FileHandler {

    /**
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
        return lines;
    }

    /**
     * Appends a single line to the end of the specified file.
     */
    public static void writeLine(String path, String line) {
        ensureFileExists(path);
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(path), StandardOpenOption.APPEND)) {
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error writing line to file: " + e.getMessage());
        }
    }

    /**
     * Overwrites the specified file entirely with the provided list of lines.
     */
    public static void overwriteFile(String path, List<String> lines) {
        ensureFileExists(path);
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(path), StandardOpenOption.TRUNCATE_EXISTING, StandardOpenOption.WRITE)) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error overwriting file: " + e.getMessage());
        }
    }
}
