package com.avidoinc.avido.services;

import com.avidoinc.avido.models.Image;
import com.avidoinc.avido.models.Product;
import com.avidoinc.avido.models.User;
import com.avidoinc.avido.repositories.ProductRepository;
import com.avidoinc.avido.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productsRepository;
    private final UserRepository userRepository;

    public List<Product> listProducts(String tittle) {

        if (tittle != null) {
            return productsRepository.findByTitle(tittle);
        } else {
            return productsRepository.findAll();
        }
    }

    public void saveProduct(Principal principal, Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1 = new Image();
        Image image2 = new Image();
        Image image3 = new Image();

        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }
        log.info("Saving product: " + product.getTitle()+". email: "+product.getUser().getEmail());

        Product productFromDb = productsRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        productsRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal != null){
            return userRepository.findByEmail(principal.getName());
        }
        return new User();

    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(Long id) {
        productsRepository.deleteById(id);
    }

    public Product getProductBy(Long id) {
        return productsRepository.findById(id).orElse(null);
    }

}
