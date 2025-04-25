-- Creating the product_image table
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

-- Creating the color table
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

-- Creating the product_category table
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Creating the product table
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Creating the product_item table
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_category_id INT NOT NULL,
    size_option_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_category_id) REFERENCES size_category(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

-- Creating the brand table
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

-- Creating the product_variation table
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    variation_name VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Creating the size_category table
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Creating the size_option table
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- Creating the product_attribute table
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_id INT NOT NULL,
    value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_id) REFERENCES attribute_category(id)
);

-- Creating the attribute_category table
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Creating the attribute_type table
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

-- Inserting sample data into product_category
INSERT INTO product_category (category_name)
VALUES ('Clothing'), ('Electronics'), ('Home Appliances');

-- Inserting sample data into brand
INSERT INTO brand (brand_name)
VALUES ('Nike'), ('Apple'), ('Samsung');

-- Inserting sample data into color
INSERT INTO color (color_name)
VALUES ('Red'), ('Blue'), ('Black');

-- Inserting sample data into size_category
INSERT INTO size_category (category_name)
VALUES ('Shoe Sizes'), ('Clothing Sizes');

-- Inserting sample data into size_option
INSERT INTO size_option (size_category_id, size_name)
VALUES (1, '8'), (1, '9'), (2, 'M'), (2, 'L');

-- Inserting sample data into product
INSERT INTO product (name, description, brand_id, category_id, base_price)
VALUES ('Nike Air Max', 'A comfortable running shoe', 1, 1, 120.00),
       ('iPhone 13', 'Apple smartphone with A15 chip', 2, 2, 999.99),
       ('Samsung TV', '55-inch 4K TV', 3, 3, 600.00);

-- Inserting sample data into product_variation
INSERT INTO product_variation (product_id, variation_name)
VALUES (1, 'Size'), (2, 'Color'), (3, 'Screen Size');

-- Inserting sample data into product_item
INSERT INTO product_item (product_id, color_id, size_category_id, size_option_id, price, stock_quantity)
VALUES (1, 1, 1, 1, 125.00, 50),
       (1, 2, 1, 2, 125.00, 30),
       (2, 1, 2, 1, 999.99, 100),
       (3, 3, 2, 1, 650.00, 20);

-- Inserting sample data into attribute_category
INSERT INTO attribute_category (category_name)
VALUES ('Physical'), ('Technical');

-- Inserting sample data into attribute_type
INSERT INTO attribute_type (type_name)
VALUES ('Text'), ('Number');
