DROP TABLE IF EXISTS order_item_attributes;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS prices;
DROP TABLE IF EXISTS product_attributes;
DROP TABLE IF EXISTS attribute_items;
DROP TABLE IF EXISTS attributes;
DROP TABLE IF EXISTS product_images;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE products (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    in_stock BOOLEAN NOT NULL,
    category_id INT,
    brand VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE product_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(255),
    image_url TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE attributes (
    id VARCHAR(255) PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL,
    product_id VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);



CREATE TABLE attribute_items (
    id VARCHAR(255) PRIMARY KEY, 
    attribute_id VARCHAR(255),
    value VARCHAR(255) NOT NULL,
    display_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (attribute_id) REFERENCES attributes(id) ON DELETE CASCADE
);

CREATE TABLE product_attributes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(255),             
    attribute_id VARCHAR(255),           
    attribute_item_id VARCHAR(255),      
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (attribute_id) REFERENCES attributes(id),
    FOREIGN KEY (attribute_item_id) REFERENCES attribute_items(id)
);

CREATE TABLE currencies (
    label VARCHAR(10) PRIMARY KEY,       
    symbol VARCHAR(5) NOT NULL           
);

CREATE TABLE prices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(255),
    amount DECIMAL(10,2),
    currency_label VARCHAR(10),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (currency_label) REFERENCES currencies(label)
);


CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE order_item_attributes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_item_id INT NOT NULL,
    attribute_id VARCHAR(255) NOT NULL,
    attribute_item_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (order_item_id) REFERENCES order_items(id),
    FOREIGN KEY (attribute_id) REFERENCES attributes(id),
    FOREIGN KEY (attribute_item_id) REFERENCES attribute_items(id)
);

INSERT INTO categories (name) VALUES 
('all'),
('clothes'),
('tech');

INSERT INTO products (id, name, description, in_stock, category_id, brand) VALUES 
('huarache-x-stussy-le', 'Nike Air Huarache Le', '<p>Great sneakers for everyday use!</p>', TRUE, 2, 'Nike x Stussy'),
('jacket-canada-goosee', 'Jacket', '<p>Awesome winter jacket</p>', TRUE, 2, 'Canada Goose'),
('ps-5', 'PlayStation 5', '<p>A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha</p>', TRUE, 3, 'Sony'),
('xbox-series-s', 'Xbox Series S 512GB', '<div> <ul> <li><span>Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer</span></li> <li><span>Spiele Games mit bis zu 120 Bilder pro Sekunde</span></li> <li><span>Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen.</span></li> <li><span>Xbox Smart Delivery stellt sicher, dass du die beste Version deines Spiels spielst, egal, auf welcher Konsole du spielst</span></li> <li><span>Spiele deine Xbox One-Spiele auf deiner Xbox Series S weiter. Deine Fortschritte, Erfolge und Freundesliste werden automatisch auf das neue System übertragen.</span></li> <li><span>Erwecke deine Spiele und Filme mit innovativem 3D Raumklang zum Leben</span></li> <li><span>Der brandneue Xbox Wireless Controller zeichnet sich durch höchste Präzision, eine neue Share-Taste und verbesserte Ergonomie aus</span></li> <li><span>Ultra-niedrige Latenz verbessert die Reaktionszeit von Controller zum Fernseher</span></li> <li><span>Verwende dein Xbox One-Gaming-Zubehör -einschließlich Controller, Headsets und mehr</span></li> <li><span>Erweitere deinen Speicher mit der Seagate 1 TB-Erweiterungskarte für Xbox Series X (separat erhältlich) und streame 4K-Videos von Disney+, Netflix, Amazon, Microsoft Movies &amp; TV und mehr</span></li> </ul> </div>', FALSE, 3, 'Microsoft'),
('apple-imac-2021', 'iMac 2021', 'The new iMac!', TRUE, 3, 'Apple'),
('apple-iphone-12-pro', 'iPhone 12 Pro', 'This is iPhone 12. Nothing else to say.', TRUE, 3, 'Apple'),
('apple-airpods-pro', 'AirPods Pro', '<h3>Magic like you’ve never heard</h3><p>AirPods Pro have been designed to deliver Active Noise Cancellation for immersive sound, Transparency mode so you can hear your surroundings, and a customizable fit for all-day comfort. Just like AirPods, AirPods Pro connect magically to your iPhone or Apple Watch. And they’re ready to use right out of the case.</p><h3>Active Noise Cancellation</h3><p>Incredibly light noise-cancelling headphones, AirPods Pro block out your environment so you can focus on what you’re listening to. AirPods Pro use two microphones, an outward-facing microphone and an inward-facing microphone, to create superior noise cancellation. By continuously adapting to the geometry of your ear and the fit of the ear tips, Active Noise Cancellation silences the world to keep you fully tuned in to your music, podcasts, and calls.</p><h3>Transparency mode</h3><p>Switch to Transparency mode and AirPods Pro let the outside sound in, allowing you to hear and connect to your surroundings. Outward- and inward-facing microphones enable AirPods Pro to undo the sound-isolating effect of the silicone tips so things sound and feel natural, like when you’re talking to people around you.</p><h3>All-new design</h3><p>AirPods Pro offer a more customizable fit with three sizes of flexible silicone tips to choose from. With an internal taper, they conform to the shape of your ear, securing your AirPods Pro in place and creating an exceptional seal for superior noise cancellation.</p><h3>Amazing audio quality</h3><p>A custom-built high-excursion, low-distortion driver delivers powerful bass. A superefficient high dynamic range amplifier produces pure, incredibly clear sound while also extending battery life. And Adaptive EQ automatically tunes music to suit the shape of your ear for a rich, consistent listening experience.</p><h3>Even more magical</h3><p>The Apple-designed H1 chip delivers incredibly low audio latency. A force sensor on the stem makes it easy to control music and calls and switch between Active Noise Cancellation and Transparency mode. Announce Messages with Siri gives you the option to have Siri read your messages through your AirPods. And with Audio Sharing, you and a friend can share the same audio stream on two sets of AirPods — so you can play a game, watch a movie, or listen to a song together.</p>', FALSE, 3, 'Apple'),
('apple-airtag', 'AirTag', '<h1>Lose your knack for losing things.</h1><p>AirTag is an easy way to keep track of your stuff. Attach one to your keys, slip another one in your backpack. And just like that, they’re on your radar in the Find My app. AirTag has your back.</p>', TRUE, 3, 'Apple');


INSERT INTO product_images (product_id, image_url) VALUES
('huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087'),
('huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087'),
('huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087'),
('huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087'),
('huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087'),

('jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg'),
('jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg'),
('jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg'),
('jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg'),
('jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg'),
('jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058169/product-image/2409L_61_o.png'),
('jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png'),

('ps-5', 'https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg'),
('ps-5', 'https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg'),
('ps-5', 'https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg'),
('ps-5', 'https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg'),
('ps-5', 'https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg'),

('xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg'),
('xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg'),
('xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg'),
('xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg'),
('xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg'),

('apple-imac-2021', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000'),
('apple-imac-2021', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-cto-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492403000'),

('apple-iphone-12-pro', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1604021663000'),


('apple-airpods-pro', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634795000'),
('apple-airpods-pro', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22_AV1?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634796000'),
('apple-airpods-pro', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22_AV2?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634797000'),
('apple-airpods-pro', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22_AV3?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634798000'),

('apple-airtag', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761672000');


INSERT INTO attributes (id, name, type,product_id) VALUES 
('huarache-x-stussy-le-size', 'Size', 'text','huarache-x-stussy-le'),
('jacket-canada-goosee-size', 'Size', 'text','jacket-canada-goosee'),
('ps-5-color','Color','swatch','ps-5'),
('ps-5-capacity','Capacity','text','ps-5'),
('xbox-series-s-color','Color','swatch','xbox-series-s'),
('xbox-series-s-capacity','Capacity','text','xbox-series-s'),
('apple-imac-2021-capacity','Capacity','text','apple-imac-2021'),
('apple-imac-2021-With USB 3 ports','With USB 3 ports','text','apple-imac-2021'),
('apple-imac-2021-Touch ID in keyboard','Touch ID in keyboard','text','apple-imac-2021'),
('apple-iphone-12-pro-capacity','Capacity','text','apple-iphone-12-pro'),
('apple-iphone-12-pro-color','Color','swatch','apple-iphone-12-pro');


INSERT INTO attribute_items (id, attribute_id, value, display_value) VALUES 
('huarache-x-stussy-le-40', 'huarache-x-stussy-le-size', '40', '40'),
('huarache-x-stussy-le-41', 'huarache-x-stussy-le-size', '41', '41'),
('huarache-x-stussy-le-42', 'huarache-x-stussy-le-size', '42', '42'),
('huarache-x-stussy-le-43', 'huarache-x-stussy-le-size', '43', '43'),
('Small', 'jacket-canada-goosee-size', 'S', 'Small'),
('Medium', 'jacket-canada-goosee-size', 'M', 'Medium'),
('Large', 'jacket-canada-goosee-size', 'L', 'Large'),
('Extra Large', 'jacket-canada-goosee-size', 'XL', 'Extra Large'),
('ps-5-Green', 'ps-5-color', '#44FF03', 'Green'),
('ps-5-Cyan', 'ps-5-color', '#03FFF7', 'Cyan'),
('ps-5-Blue', 'ps-5-color', '#030BFF', 'Blue'),
('ps-5-Black', 'ps-5-color', '#000000', 'Black'),
('ps-5-White', 'ps-5-color', '#FFFFFF', 'White'),
('ps-5-512G', 'ps-5-capacity', '512G', '512G'),
('ps-5-1T', 'ps-5-capacity', '1T', '1T'),
('xbox-series-s-Green', 'xbox-series-s-color', '#44FF03', 'Green'),
('xbox-series-s-Cyan', 'xbox-series-s-color', '#03FFF7', 'Cyan'),
('xbox-series-s-Blue', 'xbox-series-s-color', '#030BFF', 'Blue'),
('xbox-series-s-Black', 'xbox-series-s-color', '#000000', 'Black'),
('xbox-series-s-White', 'xbox-series-s-color', '#FFFFFF', 'White'),
('xbox-series-s-512G', 'xbox-series-s-capacity', '512G', '512G'),
('xbox-series-s-1T', 'xbox-series-s-capacity', '1T', '1T'),
('apple-imac-2021-256GB', 'apple-imac-2021-capacity', '256GB', '256GB'),
('apple-imac-2021-512G', 'apple-imac-2021-capacity', '512G', '512G'),
('apple-imac-2021-Yes', 'apple-imac-2021-With USB 3 ports', 'Yes', 'Yes'),
('apple-imac-2021-No', 'apple-imac-2021-With USB 3 ports', 'No', 'No'),
('apple-imac-2021-Yes_TouchID', 'apple-imac-2021-Touch ID in keyboard', 'Yes', 'Yes'),
('apple-imac-2021-No_TouchID', 'apple-imac-2021-Touch ID in keyboard', 'No', 'No'),
('apple-iphone-12-pro-512G', 'apple-iphone-12-pro-capacity', '512G', '512G'),
('apple-iphone-12-pro-1T', 'apple-iphone-12-pro-capacity', '1T', '1T'),
('apple-iphone-12-pro-Green', 'apple-iphone-12-pro-color', '#44FF03', 'Green'),
('apple-iphone-12-pro-Cyan', 'apple-iphone-12-pro-color', '#03FFF7', 'Cyan'),
('apple-iphone-12-pro-Blue', 'apple-iphone-12-pro-color', '#030BFF', 'Blue'),
('apple-iphone-12-pro-Black', 'apple-iphone-12-pro-color', '#000000', 'Black'),
('apple-iphone-12-pro-White', 'apple-iphone-12-pro-color', '#FFFFFF', 'White');



INSERT INTO currencies (label, symbol)
VALUES ('USD', '$')
ON DUPLICATE KEY UPDATE symbol = VALUES(symbol);

INSERT INTO prices (product_id, amount, currency_label) VALUES 
('huarache-x-stussy-le', 144.69, 'USD'),
('jacket-canada-goosee', 518.47, 'USD'),
('ps-5', 844.02, 'USD'),
('xbox-series-s', 333.99, 'USD'),
('apple-imac-2021', 1688.03, 'USD'),
('apple-iphone-12-pro', 1000.76, 'USD'),
('apple-airpods-pro', 300.23, 'USD'),
('apple-airtag', 120.57, 'USD');