package com.carplatform.util;

import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.*;

public class FileUploadUtil {

    /**
     * Saves an uploaded file to the specified target upload directory.
     * Returns the relative accessible path for web display.
     */
    public static String saveFile(String uploadDir, String fileName, MultipartFile multipartFile) throws IOException {
        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        try (java.io.InputStream inputStream = multipartFile.getInputStream()) {
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
            return "/uploads/" + fileName;
        } catch (IOException ioe) {
            throw new IOException("Could not save file: " + fileName, ioe);
        }
    }
}
