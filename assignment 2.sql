SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS customer_account;
DROP TABLE IF EXISTS customer_bank_account;
DROP TABLE IF EXISTS supplier_account;
DROP TABLE IF EXISTS supplier_bank_account;
DROP TABLE IF EXISTS item_on_sale;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS  buy;
DROP TABLE IF EXISTS rejected_item;
DROP TABLE IF EXISTS product;

--create the table including all customer account with the customer id as the primary key, which is not null and unique.
CREATE TABLE customer_account (
  customerid numeric(4) auto_increment,
  name VARCHAR(50) NOT NULL,
  phone_number varchar(30) NOT NULL, 
  email varchar(50) not null, 
  password varchar(20)not null,
  --
  CONSTRAINT pk_customer PRIMARY KEY(customerid)
);

--Create the children table of customer account, including the customer bank acccount
--This allow user to have 1 or more bank accounts
--No primary key, but the customer id is the foreign key. 
CREATE TABLE customer_bank_account (
  customerid numeric(4) ,
  bank_name VARCHAR(50) NOT NULL,
  bank_number VARCHAR(20) not null,
  --
  CONSTRAINT fk_customerid FOREIGN KEY (customerid) REFERENCES customer_account(customerid)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
--create the table including all supplier account with the supplier id as the primary key, which is not null and unique.
Create table supplier_account (
	supplierid numeric(4) auto_increment,
    name varchar(50),
    phone varchar(30),
    address varchar(100),
    email varchar(50), 
    password varchar(20),
    --
	CONSTRAINT pk_supplier PRIMARY KEY(supplierid)
);

--Create the children table of supplier account, including the supplier bank account
--This allow user to have 1 or more bank accounts
--No primary key, but the supplier id is the foreign key. 
create table supplier_bank_account(
	supplierid int(4),
    bank_name varchar(20), 
    bank_number numeric(20),
    CONSTRAINT fk_supplier_bank FOREIGN KEY (supplierid) REFERENCES supplier_account(supplierid)
    ON DELETE CASCADE
    ON UPDATE CASCADE
); 

--The product table have been created with the supplier as the foreign key, which is supplier id showing who supplied the product
--primary key is product id
--This is the table show the approval status: "Pending", "Approved", "Rejected"
create table product (
	product_id numeric, 
    product_name varchar(50), 
    category varchar(20),
    quantity numeric(3), 
    size varchar(20), 
    supplier numeric(4),
    unit_price DECIMAL(10,2) NOT NULL,
    approval_status varchar(10),
    --
    CONSTRAINT pk_product PRIMARY KEY(product_id),
-- 
CONSTRAINT fk_product_supplier FOREIGN KEY (supplier) REFERENCES supplier_account(supplierid)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

--When the product is approved, it will automatically appeared to be on sale.
Create table item_on_sale(
	product_id numeric,
    product_name varchar(50), 
    category varchar(20),
    quantity numeric(3), 
    size varchar(20),
    unit_price decimal(5,2),
    supplier varchar(40),
    CONSTRAINT pk_product PRIMARY KEY(product_id), 
    --
    CONSTRAINT fk_product_on_sale FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

--If the product was rejected, then it will be added in to rejected item table with the reason of rejection
Create table rejected_item (
	product_id int, 
    reason varchar(100),
    CONSTRAINT fk_rejected_product FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

--With the orders table, delivery information and order information is included. 
--the primary key is order_id, and the customer_id will be foreign key referenced by customer account table 
Create table orders (
	order_id int auto_increment,
    order_datetime datetime,
    customer_id int(4), 
    customer_name varchar(30), 
    customer_address varchar(30), 
    customer_phone varchar(20), 
    order_status varchar(10),
    discount numeric(10),
    CONSTRAINT pk_order PRIMARY KEY(order_id),
    --
    CONSTRAINT fk_customer_order FOREIGN KEY (customer_id) REFERENCES customer_account(customerid)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

--Be the children table of order table, the buy table is include which product that each orders included. 
Create table buy (
	order_id int (4),
    product_id int (4), 
    quantity numeric(3),
--
CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    --
    CONSTRAINT fk_order_buy_which_product FOREIGN KEY (product_id) REFERENCES item_on_sale(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

insert into customer_account (name, email, phone_number, password) values 
('Emilia Dunsford', 'edunsford0@canalblog.com', '838-232-1446','edunsford0'),
('Max McConnachie', 'mmcconnachie1@washingtonpost.com', '798-485-9892', 'mmconnachie1'),
('Hank Tabour', 'htabour2@posterous.com', '546-328-1116','htabour2'),
('Wes Haggerstone', 'whaggerstone3@kickstarter.com', '242-505-5789','whaggerstone3'),
('Jaquenette Bowra',  'jbowra4@disqus.com', '118-143-4313','jbowra4'),
('Colline Gwilliam', 'cgwilliam5@blinklist.com', '919-939-6466','cgwilliam5'),
('Kakalina Bayliss', 'kbayliss6@nature.com', '810-448-3082','kbayliss6'),
('Sherilyn Edds', 'sedds7@bloglovin.com', '453-216-3173','sedds7'),
('Theodore Jennaroy', 'tjennaroy8@amazonaws.com', '934-206-3164','tjennaroy8'),
('Elicia Buckthought','ebuckthought9@marketwatch.com', '346-215-1183','ebuckthought9'),
('Hinda Vedyashkin','hvedyashkinc@blogs.com', '424-617-9479', 'hvedyashkinc'), 
('Marty Radolf', 'mradolfd@irs.gov', '806-986-5074', 'mradolfd'),
('Laurianne Lyon', 'llyone@epa.gov', '391-727-1663','llyone'),
('Earle Dunnet',  'edunnetf@mayoclinic.com', '994-941-6395', 'edunnetf'),
('Tristan Cruddace','tcruddaceg@mlb.com', '974-432-8365', 'tcruddaceg'),
('Flss Brass','fbrassh@jiathis.com', '995-339-8722','fbrassh'),
('Leese Cromb', 'lcrombi@sina.com.cn', '452-593-0492','lcrombi'),
('Maudie Diddams','mdiddamsj@narod.ru', '880-491-4794','mdiddamsj'),
('Tilly Hollyar', 'thollyark@aboutads.info', '647-759-3260','thoyyyark'),
('Fitz Ferroni','fferronil@addthis.com', '141-626-2674', 'fferronil'),
('Robina Trainor', 'rtrainorm@hibu.com', '659-456-4879', 'rtrainorm'),
('Eugene Daynter', 'edayntern@ezinearticles.com', '113-727-3027', 'edayntern'),
('Trixy Le Noire',  'tleo@chron.com', '492-926-0482', 'tleo'),
('Web Honnan', 'whonnanp@xing.com', '170-376-2548', 'whonnanp'),
('Irina Woodus','iwoodusq@apple.com', '272-177-8032', 'iwoodusq'),
('Mada Davys', 'mdavysr@dailymail.co.uk', '367-995-7794', 'mdavysr'),
('Concordia Rodgers', 'crodgerss@exblog.jp', '282-866-1116', 'crodgerss'),
('Rowland Algate',  'ralgatet@nbcnews.com', '703-113-0581', 'ralgatet'),
('Leroy Pedycan',  'lpedycanu@wired.com', '767-246-5005', 'lpedycanu'), 
('Maiga Stennett', 'mstennettv@altervista.org', '460-969-5244', 'mstennettv'), 
('Katine Corness', 'kcornessw@creativecommons.org', '184-115-9373', 'kcornessw'), 
('Berkly Switland', 'bswitlandx@stumbleupon.com', '135-458-2450', 'bswitlandx'), 
('Brien Hearty', 'bheartyy@eepurl.com', '552-861-5499', 'bheartyy'), 
('Winna MacRirie', 'wmacririez@cbsnews.com', '158-305-0522', 'wmacririez'), 
('Devin Brighouse', 'dbrighouse10@unicef.org', '320-610-2620', 'dbrighouse10'), 
('Wilfrid Suermeier',  'wsuermeier11@wordpress.com', '614-134-2789', 'wsuermeier11'), 
('Lonni Semeradova',  'lsemeradova12@pen.io', '686-367-2522', 'lsemeradova12'), 
('Oates Palin', 'opalin13@eepurl.com', '594-572-1319', 'opalin13'),
('Cornell St Ledger', 'cst1a@multiply.com', '628-978-3107', 'cst1a'), 
('Ermanno Winning', 'ewinning1b@fastcompany.com', '723-890-0539', 'ewinning1b'), 
('Jock Murray', 'jmurray1c@sciencedaily.com', '762-746-0227', 'jmurray1c'), 
('Darn Eddisford',  'deddisford1d@lycos.com', '995-225-8703', 'deddisford1d'), 
('Isadore Jimmes', 'ijimmes1e@zdnet.com', '927-793-6591', 'ijimmes1e'), 
('Gypsy Stubbe', 'gstubbe1f@photobucket.com', '311-223-6103', 'gstubbe1f'), 
('Wenda Curmi','wcurmi1g@exblog.jp', '712-595-4786', 'wcurmi1g'), 
('Lianne Fiennes','lfiennes1h@amazon.co.uk', '219-977-5408', 'lfiennes1h'), 
('Guenevere McRavey', 'gmcravey1i@google.nl', '463-344-9835', 'gmcravey1i'), 
('Sergeant Foxten', 'sfoxten1j@woothemes.com', '951-324-5779', 'sfoxten1j'),
('Michale Winham','mwinham1k@google.fr', '868-608-9068', 'mwinham1k'), 
('Rena Millier', 'rmillier1l@prweb.com', '793-765-9073', 'rmillier1l'), 
('Kissiah Raspison', 'kraspison1m@g.co', '905-403-3557', 'kraspison1m'), 
('Renate Hovey', 'rhovey1n@geocities.jp', '853-329-7622', 'rhovey1n'), 
('Roxie Ellington','rellington1o@microsoft.com', '756-864-4064', 'rellington1o'), 
('Reidar Steen', 'rsteen1p@vkontakte.ru', '338-641-7697', 'rsteen1p'), 
('Joline McKerron','jmckerron1q@reuters.com', '932-642-6830', 'jmckerron1q'), 
('Raymund Charman','rcharman1r@jiathis.com', '393-557-4354', 'rcharman1r'), 
('Ulrikaumeko Howship', 'uhowship1s@twitter.com', '306-989-3419', 'uhowship1s'), 
('Che Picker','cpicker1t@fotki.com', '862-254-7816', 'cpicker1t'),
('Den Dolbey', 'ddolbey1u@wp.com', '251-174-9588','ddolbey1u'),
('Boy Eaglesham', 'beaglesham1v@vimeo.com', '205-127-2323','beaglesham1v'),
('Tymothy Yurenev', 'tyurenev1w@msn.com', '971-421-2978','tyurenev1w'),
('Tremayne Broadberry',  'tbroadberry1x@google.es', '360-137-9261','tbroadberry1x'),
('Justinn Klain','jklain1y@washington.edu', '159-659-0445', 'jklain1y'),
('Lita Di Franceshci','ldi1z@indiegogo.com', '408-156-9952','ldi1z'),
('Burt Boothebie','bboothebie20@skype.com', '990-957-3106','bboothebie20'),
('Tani McGilvra','tmcgilvra21@360.cn', '570-981-8745', 'tmcgilvra21'),
('Lurlene Cherrison','lcherrison22@wiley.com', '223-104-1683','lcherrison22'),
('Vonni Palfrey','vpalfrey23@smh.com.au', '648-318-0973','vpalfrey23'),
('Elisha Watkiss','ewatkiss24@mtv.com', '181-145-4068','ewatkiss24'),
('Bucky Labbet','blabbet25@boston.com', '178-927-3084','blabbet25'),
('Michele Fellenor','mfellenor26@google.com.hk', '818-238-9419','mfellenor26'),
('Leicester Peracco', 'lperacco27@oakley.com', '766-874-0123','lperacco27'),
('Tallie Bainton',  'tbainton28@ask.com', '619-698-9454','tbainton28'),
('Robenia Durbin', 'rdurbin29@xrea.com', '374-225-8140','rdurbin29'),
('Ettie Gregine', 'egregine2a@baidu.com', '632-707-4745','egregine2a'),
('Ferdie Lamdin', 'flamdin2b@fastcompany.com', '840-650-9750','flamdin2b'),
('Gypsy McCroft', 'gmccroft2c@hhs.gov', '461-744-2884','gmccroft2c'),
('Fredelia Kinningley', 'fkinningley2d@smh.com.au', '869-635-3860','fkinningley2d'),
('Maris Bidwell', 'mbidwell2f@devhub.com', '762-436-2224','mbidwell2f'),
('Katherina Sullly',  'ksullly2g@ucoz.ru', '289-759-5280','ksullly2g'),
('Daren Money','dmoney2h@sina.com.cn', '696-997-4548','dmoney2h'),
('Karilynn Backson','kbackson2j@plala.or.jp', '716-893-8028','kbackson2j'),
('Nolie Duffield','nduffield2k@example.com', '941-780-5898','nduffield2k'),
('Lotti Eynaud', 'leynaud2l@dot.gov', '650-142-3337','leynaud2l'),
('Oran Tindley','otindley2m@biglobe.ne.jp', '335-580-3528','otindley2m'),
('Cherilyn Gitsham', 'cgitsham2n@virginia.edu', '424-606-8702','cgitsham2n'),
('Temp Addy', 'taddy2o@go.com', '831-327-1778','taddy2o'),
('Rosalinda Feavers','rfeavers2p@1688.com', '971-158-2896','rfeavers2p'),
('Abbey Farmery', 'afarmery2q@linkedin.com', '637-411-2594','afarmery2q'),
('Raynard Softley','rsoftley2r@bluehost.com', '523-999-2863','rsoftley2r'),
('Dael Mussotti', 'dmussotti2s@nature.com', '111-618-8398','dmussotti2s'),
('Pippy M''Quharge','pmquharge2t@weebly.com', '739-638-1179','pmquharge2t'),
('Ketti Allibone','kallibone2u@dell.com', '208-651-9051','kallibone2u'),
('Jesus Stain','jstain2v@altervista.org', '197-151-3404','jstain2v'),
('Suzi Thorndale','sthorndale2w@cyberchimps.com', '366-973-2482','sthorndale2w'),
('Karylin Sabine', 'ksabine2x@bloomberg.com', '752-856-8196','ksabine2x'),
('Gaylene Jillins', 'gjillins2y@shinystat.com', '691-487-0746','gjillins2y'),
('Gladi Dobbinson','gdobbinson2z@reuters.com', '703-576-9709','gdobbinson2z'),
('Odetta Petrashkov','opetrashkov30@purevolume.com', '958-187-7101','opetrashkov30');

Insert into customer_bank_account (customerid, bank_name, bank_number) values 
 (1, 'JPMorgan Chase Bank',  1234567890), (2, 'Bank of America',  9876543210), 
 (3, 'Citibank',  1357924680), (4, 'Wells Fargo',  2468013579), (5, 'HSBC',  5678901234), 
 (5, 'Deutsche Bank',  9012345678), (6, 'Barclays',  3579124680), (7, 'BNP Paribas',  7890123456), 
 (8, 'Credit Suisse',  2468013579), (8, 'UBS',  6789012345), (9, 'Bank of America', 1234567890), (10, 'Capital One', 1357924680), 
 (11, 'U.S. Bank', 1234567890), (12, 'PNC Bank', 9876543210), (59, 'Bank of America', 1234567890),
(63, 'Citibank', 1734567890), (37, 'JPMorgan Chase', 1122334455), (13, 'Wells Fargo', 6789012345),
(14, 'Citibank', 5544332211), (15, 'Bank of America', 9876543210), (16, 'JPMorgan Chase', 0123456789),
(17, 'Wells Fargo', 9876543210), (18, 'Citibank', 1234567890),(18, 'Wells Fargo', 1264565890),
(19, 'Bank of America', 5544332211),(20, 'JPMorgan Chase', 9876543210),(21, 'Wells Fargo', 1122334455),
(22, 'Citibank', 6789012345),(23, 'Bank of America', 1234567890), (24, 'JPMorgan Chase', 5544332211), 
(25, 'Wells Fargo', 9876543210), (26, 'Citibank', 1122334455),(27, 'Bank of America', 6789012345),
(28, 'JPMorgan Chase', 1234567890), (29, 'Wells Fargo', 5544332211),(30, 'Citibank', 9876543210),
(31, 'Bank of America', 1122334455), (31, 'Wells Fargo', 1124334425),(31, 'JPMorgan Chase', 1122734485),
(32, 'JPMorgan Chase', 6789012345),(33, 'Wells Fargo', 1234567890), (34, 'Citibank', 5544332211),
(35, 'Bank of America', 9876543210), (36, 'JPMorgan Chase', 1122334455), (37, 'Wells Fargo', 6789012345),
(38, 'JPMorgan Chase', 1234555890),(38, 'Citibank', 1234578691), (39, 'Bank of America', 5544332211),
(40, 'JPMorgan Chase', 9876543210), (41, 'Wells Fargo', 1122334455), (42, 'Citibank', 6789012345),
(43, 'Bank of America', 1234567890), (44, 'JPMorgan Chase', 5544332211),(45, 'Wells Fargo', 9876543210),
(46, 'Citibank', 1122334455), (47, 'Bank of America', 6789012345),(48, 'MB Bank', 1234567890),
(49, 'Wells Fargo', 5544332211),(50, 'Citibank', 9876543210),(51, 'Bank of America', 1122334455),
(52, 'MSBS', 6999012345), (52, 'Techcombank', 6789000345), (52, 'Bank of China', 6781012343),
(53, 'HSBC', 1234567890), (54, 'Bank of China Limited', 5544332211),
(55, 'Mitsubishi UFJ Financial Group', 9876543210), (56, 'Morgan Stanley', 1122334455),
(57, 'UBS', 6789012345), (58, 'Deutsche Bank', 1234567890), (59, 'Agricultural Bank of China Limited', 5544332211),
(60, 'JPMorgan Chase', 9876543210),(61, 'Wells Fargo', 1122334455),
(62, 'Mizuho', 6789012345), (63, 'Bank of America', 1234567890), (63, 'Toronto-Dominion Bank', 1234447890),
(64, 'MB Bank', 5544332211), (65, 'Sacombank', 9876543210), (66, 'ACB Bank', 1122334455),
(67, 'Bank of America', 6789012345), (68, 'JPMorgan Chase', 1234567890), (69, 'Momo', 5544332211),
(70, 'Citibank', 9876543210), (71, 'Bank of America', 1122334455),
(72, 'JPMorgan Chase', 6789012345), (73, 'Wells Fargo', 1234567890) ,(74, 'Citibank', 5544332211),
(74, 'Agricultural Bank of China Limited', 5244378211),(75, 'Bank of America', 9876543210),
(76, 'JPMorgan Chase', 1122334455), (77, 'Wells Fargo', 6789012345),(78, 'Citibank', 1234567890),
(79, 'MB Bank', 5544332211), (80, 'Sacombank', 9876543210), (81, 'SCB Bank', 1122334455), 
(82, 'TP Bank', 6789012345), (83, 'Vietcombank', 1234567890), (84, 'HD Bank', 5544332211),
(85, 'Bank of China', 9876543210), (86, 'Bank of India', 1122334455), (87, 'HD Bank', 6789012345),
(88, 'Sacombank', 1234567890), (89, 'Vietcombank', 5544332211), (89, 'Agricultural Bank of China Limited', 8144752211),
(90, 'Citibank', 9876543210),(91, 'Duetsche Bank', 1122334455), (92, 'MB Bank', 6789012345),
(93, 'Vietcombank', 1234567890),(94, 'Citibank', 5544332211), (95, 'Bank of America', 9876543210),
(96, 'JPMorgan Chase', 1122334455), (97, 'Vietcombank', 6789012345), (98, 'Bank of America', 1234897890),
(98, 'MB Bank', 1233467890),(99, 'HD Bank', 5544332211),(100, 'Vietcombank', 9876543210);

Insert into product(product_id, product_name, category, quantity, product_size, supplier, unit_price, approved_status) values
(1,'Recycled Glass Jewelry Set', 'Accessories', 3, 'Various', 39, 35.50, 'Approved'), 
(2, 'Macrame Wall Hanging', 'Home Decor', 1, '3 ft', 12, 42.15, 'Pending'), 
(3, 'Hand-Forged Iron Candle Holder', 'Home Decor', 2, 'Small', 6, 28.70, 'Rejected'), 
(4, 'Leather-Bound Journal', 'Stationery', 3, 'Medium', 23, 25.30, 'Approved'), 
(5, 'Hand-Embroidered Cushion Covers', 'Home Decor', 4, '20x20"', 40, 50.85, 'Pending'), 
(6, 'Woven Basket', 'Home Decor', 1, 'Large', 19, 30.20, 'Rejected'), 
(8, 'Copper Tea Kettle', 'Kitchen', 1, '2 L', 27, 85.10, 'Pending'), 
(9, 'Hand-Painted Silk Scarf', 'Accessories', 2, 'Square', 35, 70.45, 'Rejected'), 
(10, 'Rattan Furniture Set', 'Outdoors', 1, '2 Chairs & Table', 32, 120.00, 'Approved'), 
(11, 'Handmade Soap', 'Personal Care', 10, 'Various Scents', 36, 15.60, 'Pending'), 
(12, 'Hand-Woven Rug', 'Home Decor', 1, '8x10 ft', 34, 180.50, 'Rejected'), 
(13, 'Terracotta Flower Pots', 'Home Decor', 6, 'Small', 29, 20.15, 'Approved'), 
(14, 'Hand-Carved Wooden Mask', 'Decorative Art', 1, 'Tribal Style', 41, 80.70, 'Pending'), 
(15, 'Bamboo Flute', 'Musical Instruments', 1, 'Traditional', 2, 45.25, 'Rejected'), 
(16, 'Hand-Dyed Fabric', 'Textiles', 5, 'Various Colors', 28, 35.90, 'Approved'), 
(17, 'Pressed Flower Greeting Cards', 'Stationery', 10, 'Assorted', 15, 12.30, 'Pending'), 
(18, 'Hand-Painted Porcelain Teacup & Saucer Set', 'Tableware', 2, 'Floral', 7, 55.65, 'Rejected'), 
(19, 'Recycled Tire Swing', 'Outdoors', 1, 'Adult Size', 38, 60.10, 'Approved'), 
(20, 'Hand-Knitted Baby Blanket', 'Baby', 1, 'Soft Wool', 20, 40.45, 'Pending'), 
(21, 'Hand-Painted Wooden Toys', 'Toys', 3, 'Animals', 42, 25.70, 'Rejected'), 
(22, 'Dried Flower Arrangement', 'Home Decor', 1, 'Large', 14, 38.00, 'Approved'), 
(23, 'Hand-Forged Iron Fire Poker', 'Fireplace', 1, 'Decorative', 5, 45.35, 'Pending'), 
(24, 'Leather-Crafted Belt', 'Accessories', 2, 'Hand-Tooled', 24, 55.60, 'Rejected'), 
(25, 'Hand-Embroidered Wall Art', 'Home Decor', 1, 'Large Floral', 10, 75.15, 'Approved'), 
(26, 'Recycled Glass Bottles', 'Decorative Art', 6, 'Various Shapes', 16, 22.80, 'Pending'), 
(27, 'Macrame Plant Hanger', 'Home Decor', 3, 'Small', 26, 28.45, 'Rejected'), 
(28, 'Hand-Carved Wooden Chess Set', 'Games', 1, 'Intricate', 41, 120.20, 'Approved'), 
(29, 'Woolen Knitted Hat', 'Accessories', 4, 'Winter', 21, 30.00, 'Pending'), 
(30, 'Hand-Painted Ceramic Tiles', 'Home Decor', 10, 'Decorative', 37, 18.55, 'Rejected'), 
(31, 'Rattan Chair', 'Furniture', 1, 'Single', 31, 80.70, 'Approved'), 
(32, 'Handmade Soap', 'Personal Care', 10, 'Lavender', 36, 15.10, 'Pending'), 
(33, 'Hand-Woven Rug Runner', 'Home Decor', 1, 'Hallway Size', 33, 75.25, 'Rejected'), 
(34, 'Terracotta Flower Pots', 'Home Decor', 6, 'Medium', 29, 25.40, 'Approved'), 
(35, 'Hand-Carved Wooden Spoon', 'Kitchen', 5, 'Various Sizes', 41, 12.65, 'Pending'), 
(36, 'Bamboo Bird Feeder', 'Outdoors', 1, 'Hanging', 2, 20.30, 'Rejected'), 
(37, 'Hand-Dyed Fabric', 'Textiles', 5, 'Indigo', 28, 38.15, 'Approved'),
(38, 'Pressed Flower Bookmarks', 'Stationery', 15, 'Assorted', 15, 8.20, 'Pending'), 
(39, 'Hand-Painted Porcelain Teapot', 'Tableware', 1, 'Floral', 7, 65.00, 'Rejected'), 
(40, 'Recycled Tire Planter', 'Outdoors', 2, 'Large', 38, 40.85, 'Approved'), 
(41, 'Hand-Knitted Baby Booties', 'Baby', 5, 'Soft Yarn', 20, 15.50, 'Pending'), 
(42, 'Hand-Painted Wooden Toys', 'Toys', 3, 'Cars', 42, 28.25, 'Rejected'), 
(43, 'Dried Flower Bouquet', 'Home Decor', 1, 'Medium', 14, 32.10, 'Approved'), 
(44, 'Hand-Forged Iron Fireplace Tools', 'Fireplace', 1, 'Set of 3', 5, 90.45, 'Pending'), 
(45, 'Leather-Crafted Wallet', 'Accessories', 1, 'Hand-Tooled', 24, 60.70, 'Rejected'), 
(46, 'Hand-Embroidered Tablecloth', 'Home Decor', 1, 'Round', 10, 150.35, 'Approved'), 
(47, 'Recycled Glass Bowls', 'Home Decor', 4, 'Various Sizes', 16, 35.00, 'Pending'), 
(48, 'Macrame Dream Catcher', 'Home Decor', 1, 'Large', 26, 48.60, 'Rejected'), 
(49, 'Hand-Carved Wooden Chess Pieces', 'Games', 1, 'Intricate', 41, 85.85, 'Approved'), 
(50, 'Woolen Knitted Gloves', 'Accessories', 3, 'Winter', 21, 25.20, 'Pending'), 
(51, 'Hand-Painted Ceramic Wall Plaques', 'Home Decor', 3, 'Decorative', 37, 22.00, 'Rejected'), (52, 'Rattan Chair', 'Furniture', 1, 'Single', 31, 80.00, 'Approved'), (53, 'Handmade Soap', 'Personal Care', 10, 'Lavender', 36, 15.00, 'Pending'), (54, 'Hand-Woven Rug Runner', 'Home Decor', 1, 'Hallway Size', 33, 75.00, 'Rejected'), (55, 'Terracotta Flower Pots', 'Home Decor', 6, 'Medium', 29, 25.00, 'Approved'), (56, 'Hand-Carved Wooden Spoon', 'Kitchen', 5, 'Various Sizes', 41, 12.00, 'Pending'), (57, 'Bamboo Bird Feeder', 'Outdoors', 1, 'Hanging', 2, 20.00, 'Rejected'), (58, 'Hand-Dyed Fabric', 'Textiles', 5, 'Indigo', 28, 38.00, 'Approved'), (59, 'Pressed Flower Bookmarks', 'Stationery', 15, 'Assorted', 15, 8.00, 'Pending'), (60, 'Hand-Painted Porcelain Teapot', 'Tableware', 1, 'Floral', 7, 65.00, 'Rejected'), (61, 'Recycled Tire Planter', 'Outdoors', 2, 'Large', 38, 40.00, 'Approved'), (62, 'Hand-Knitted Baby Booties', 'Baby', 5, 'Soft Yarn', 20, 15.00, 'Pending'), (63, 'Hand-Painted Wooden Toys', 'Toys', 3, 'Cars', 42, 28.00, 'Rejected'), (64, 'Dried Flower Bouquet', 'Home Decor', 1, 'Medium', 14, 32.00, 'Approved'), (65, 'Hand-Forged Iron Fireplace Tools', 'Fireplace', 1, 'Set of 3', 5, 90.00, 'Pending'), (66, 'Leather-Crafted Wallet', 'Accessories', 1, 'Hand-Tooled', 24, 60.00, 'Rejected'), (67, 'Hand-Embroidered Tablecloth', 'Home Decor', 1, 'Round', 10, 150.00, 'Approved'), (68, 'Recycled Glass Bowls', 'Home Decor', 4, 'Various Sizes', 16, 35.00, 'Pending'), (69, 'Macrame Dream Catcher', 'Home Decor', 1, 'Large', 26, 48.00, 'Rejected'),


insert into supplier_bank_account (supplierid, bank_name, bank_number) values
(1, 'Vietcombank', '0011223344'), (2, 'Techcombank', '0022334455'), 
(3, 'VietinBank', '0033445566'), (4, 'Sacombank', '0044556677'), 
(5, 'ACB', '0055667788'), (6, 'TPBank', '0066778899'), (7, 'Vietcombank', '0011223344'), 
(8, 'Techcombank', '0022334455'), (9, 'VietinBank', '0033445566'), (10, 'Sacombank', '0044556677'), 
(11, 'ACB', '0055667788'), (12, 'TPBank', '0066778899'), (13, 'Vietcombank', '0011223344'), (14, 'Techcombank', '0022334455'), 
(15, 'VietinBank', '0033445566'), (16, 'Sacombank', '0044556677'), (17, 'ACB', '0055667788'), (18, 'TPBank', '0066778899'), 
(19, 'Vietcombank', '0011223344'), (20, 'Techcombank', '0022334455'), (1, 'VietinBank', '0033445566'), 
(2, 'Sacombank', '0044556677'), (3, 'ACB', '0055667788'), (4, 'TPBank', '0066778899'), 
(5, 'Vietcombank', '0011223344'), (6, 'Techcombank', '0022334455'), (7, 'VietinBank', '0033445566'), 
(8, 'Sacombank', '0044556677'), (9, 'ACB', '0055667788'), (10, 'TPBank', '0066778899'), (21, 'Vietcombank', '1234567890'), 
(23, 'Techcombank', '9876543210'), (25, 'VietinBank', '1234567890'), (21, 'Agribank', '0123456789'), 
(28, 'TPBank', '9876543210'), (23, 'Vietcombank', '1234567890'), (30, 'Sacombank', '0123456789'), 
(25, 'VietinBank', '9876543210'), (32, 'BIDV', '1234567890'), (21, 'Agribank', '987654321'), 
(34, 'ACB', '0123456789'), (23, 'Techcombank', '1234567890'), (36, 'VPBank', '9876543210'), 
(25, 'VietinBank', '0123456789'), (38, 'HSBC', '1234567890'), 
(21, 'Agribank', '1234567890'), (40, 'MSB', '9876543210'), (23, 'Vietcombank', '9876543210'), 
(42, 'Eximbank', '0123456789'), (25, 'VietinBank', '1234567890'), (44, 'Maritime Bank', '9876543210'), 
(21, 'Agribank', '0123456789'), (45, 'SCB', '1234567890'), (23, 'Techcombank', '1234567890'), 
(43, 'OCB', '9876543210'), (25, 'VietinBank', '9876543210'), (42, 'Eximbank', '0123456789'), 
(21, 'Agribank', '1234567890'), (40, 'MSB', '9876543210'), (23, 'Vietcombank', '1234567890'), 
(38, 'HSBC', '9876543210'), (25, 'VietinBank', '0123456789'), (36, 'VPBank', '1234567890'), 
(21, 'Agribank', '9876543210'), (34, 'ACB', '0123456789'), (35, 'Vietcombank', '1234567890'),
(37, 'Techcombank', '9876543210'),(39, 'VietinBank', '1234567890'),(35, 'Agribank', '0123456789'),
(41, 'TPBank', '9876543210'),(37, 'Vietcombank', '123456790'),(43, 'Sacombank', '0123456789'),
(39, 'VietinBank', '9876543210'),(35, 'BIDV', '1234567890'),(40, 'Agribank', '9876543210') ,
(37, 'Techcombank', '1234567890') ,(42, 'VPBank', '9876543210') ,(39, 'VietinBank', '0123456789') ,
(35, 'HSBC', '1234567890'),(45, 'MSB', '9876543210');

select * from supplier_bank_account 
order by supplierid;

insert into orders(order_datetime, customer_id, customer_name, customer_address, customer_phone, order_status, discount) values 
('2024-12-22 15:30:15', 77, 'Nguyen Van A', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-12-22 16:15:20', 32, 'Tran Thi B', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-12-22 14:45:30', 77, 'Nguyen Van A', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-12-22 17:00:00', 15, 'Le Thi C', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.25), 
('2024-12-22 15:45:45', 88, 'Vo Van D', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0.00), 
('2024-12-22 16:30:25', 32, 'Tran Thi B', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.10), 
('2024-12-22 14:30:00', 55, 'Pham Thi E', '123 Le Duan Street, District 1, Ho Chi Minh City', '0945678901', 'Completed', 0.00), 
('2024-12-22 17:15:10', 15, 'Le Thi C', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.075), 
('2024-12-22 15:00:10', 21, 'Nguyen Van F', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00), 
('2024-12-22 16:45:35', 88, 'Vo Van D', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03), 
('2024-12-22 15:30:15', 77, 'Nguyen Van A', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-12-22 16:15:20', 32, 'Tran Thi B', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-12-22 14:45:30', 77, 'Nguyen Van A', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-12-22 17:00:00', 15, 'Le Thi C', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-12-22 15:45:45', 88, 'Vo Van D', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0.00), 
('2024-12-22 16:30:25', 32, 'Tran Thi B', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.10);

insert into orders(order_datetime, customer_id, customer_name, customer_address, customer_phone, order_status, discount) values
('2024-07-15 15:30:15', 1, 'Emilia Dunsford', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-11-21 16:15:20', 2, 'Max McConnachie', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-06-08 14:45:30', 1, 'Emilia Dunsford', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-03-12 17:00:00', 3, 'Hank Tabour', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-12-22 15:00:10', 4, 'Wes Haggerstone', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00), 
('2024-05-18 16:45:35', 5, 'Jaquenette Bowra', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03), 
('2024-09-27 15:30:15', 6, 'Colline Gwilliam', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-01-11 16:15:20', 7, 'Kakalina Bayliss', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00),
('2024-02-23 14:45:30', 6, 'Colline Gwilliam', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00),
('2024-11-05 17:00:00', 8, 'Sherilyn Edds', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-08-19 15:45:45', 9, 'Theodore Jennaroy', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0.00), 
('2024-12-12 16:15:20', 10, 'Elicia Buckthought', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.10), 
('2024-03-28 14:45:30', 9, 'Theodore Jennaroy', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-07-04 17:00:00', 11, 'Hinda Vedyashkin', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-11-25 15:00:10', 12, 'Marty Radolf', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00), 
('2024-02-16 16:45:35', 13, 'Laurianne Lyon', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03), 
('2024-08-09 15:30:15', 14, 'Earle Dunnet', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-01-29 16:15:20', 15, 'Le Thi C', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-03-11 14:45:30', 14, 'Earle Dunnet', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-10-20 17:00:00', 16, 'Tristan Cruddace', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-05-06 15:45:45', 17, 'Flss Brass', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0.00),
('2024-11-30 16:15:20', 18, 'Leese Cromb', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.10), 
('2024-02-14 14:45:30', 17, 'Flss Brass', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-09-08 17:00:00', 70, 'Bucky Labbet', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-04-25 15:00:10', 71, 'Michele Fellenor', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00),  
('2024-10-17 16:45:35', 72, 'Leicester Peracco', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03),  
('2024-07-15 15:30:15', 1, 'Emilia Dunsford', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-11-21 16:15:20', 2, 'Max McConnachie', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-06-08 14:45:30', 1, 'Emilia Dunsford', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-03-12 17:00:00', 3, 'Hank Tabour', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-12-22 15:00:10', 4, 'Wes Haggerstone', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00), 
('2024-05-18 16:45:35', 5, 'Jaquenette Bowra', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03), 
('2024-09-27 15:30:15', 6, 'Colline Gwilliam', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-01-11 16:15:20', 7, 'Kakalina Bayliss', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-02-23 14:45:30', 6, 'Colline Gwilliam', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-11-05 17:00:00', 8, 'Sherilyn Edds', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-08-19 15:45:45', 9, 'Theodore Jennaroy', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0.00), 
('2024-12-12 16:15:20', 10, 'Elicia Buckthought', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.10), 
('2024-03-28 14:45:30', 9, 'Theodore Jennaroy', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.00), 
('2024-07-04 17:00:00', 11, 'Hinda Vedyashkin', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025),
('2024-11-25 15:00:10', 12, 'Marty Radolf', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00), 
('2024-02-16 16:45:35', 13, 'Laurianne Lyon', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03), 
('2024-08-09 15:30:15', 14, 'Earle Dunnet', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-01-29 16:15:20', 15, 'Le Thi C', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-03-11 14:45:30', 14, 'Earle Dunnet', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', '0.00'), 
('2024-10-20 17:00:00', 16, 'Tristan Cruddace', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', '0.025'),
('2024-05-06 15:45:45', 17, 'Flss Brass', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', '0.00'), 
('2024-11-30 16:15:20', 18, 'Leese Cromb', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', '0.10'), 
('2024-02-14 14:45:30', 17, 'Flss Brass', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', '0.00'), 
('2024-09-08 17:00:00', 70, 'Bucky Labbet', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', '0.025'), 
('2024-04-25 15:00:10', 71, 'Michele Fellenor', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', '0.00'),  
('2024-10-17 16:45:35', 72, 'Leicester Peracco', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', '0.03');  

insert into orders(order_datetime, customer_id, customer_name, customer_address, customer_phone, order_status, discount) values 
('2024-06-01 15:30:15', 73, 'Tallie Bainton', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-12-10 16:15:20', 74, 'Robenia Durbin', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0), 
('2024-12-22 14:45:30', 60, 'Boy Eaglesham', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0), 
('2024-12-22 17:00:00', 61, 'Tymothy Yurenev', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-12-22 15:45:45', 62, 'Tremayne Broadberry', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0), 
('2024-12-22 14:45:30', 60, 'Boy Eaglesham', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.0), 
('2024-12-22 17:00:00', 61, 'Tymothy Yurenev', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-12-22 15:45:45', 62, 'Tremayne Broadberry', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0.0), 
('2024-07-15 15:30:15', 50, 'Rena Millier', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-11-21 16:15:20', 51, 'Kissiah Raspison', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.0), 
('2024-06-08 14:45:30', 50, 'Rena Millier', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.0), 
('2024-03-12 17:00:00', 52, 'Renate Hovey', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-05-25 08:30:00', 53, 'Roxie Ellington', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.075), 
('2024-11-18 16:15:00', 54, 'Reidar Steen', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0), 
('2024-08-07 08:15:00', 55, 'Joline McKerron', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-07-28 16:30:00', 56, 'Raymund Charman', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.025), 
('2024-09-10 08:00:00', 57, 'Ulrikaumeko Howship', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.100), 
('2024-05-11 16:45:00', 58, 'Che Picker', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Processing', 0.075), 
('2024-11-23 07:45:00', 59, 'Den Dolbey', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0), 
('2024-06-16 17:00:00', 60, 'Boy Eaglesham', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.050), 
('2024-08-27 07:30:00', 61, 'Tymothy Yurenev', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.025), 
('2024-10-04 17:15:00', 62, 'Tremayne Broadberry', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0901234567', 'Processing', 0.100), 
('2024-05-09 07:15:00', 63, 'Justinn Klain', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.075),
('2024-11-13 17:30:00', 64, 'Lita Di Franceshci', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Processing', 0), 
('2024-07-01 07:00:00', 65, 'Burt Boothebie', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.050), 
('2024-09-26 17:45:00', 66, 'Tani McGilvra', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.025), 
('2024-09-08 17:00:00', 70, 'Bucky Labbet', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.100), 
('2024-04-25 15:00:10', 71, 'Michele Fellenor', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00), 
('2024-10-17 16:45:35', 72, 'Leicester Peracco', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03), 
('2024-06-01 15:30:15', 73, 'Tallie Bainton', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-12-10 16:15:20', 74, 'Robenia Durbin', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-07-03 18:30:00', 75, 'Ettie Gregine', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.100), 
('2024-09-17 06:00:00', 76, 'Ferdie Lamdin', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.075), 
('2024-06-01 15:30:15', 73, 'Tallie Bainton', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-12-10 16:15:20', 74, 'Robenia Durbin', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0), 
('2024-12-22 14:45:30', 60, 'Boy Eaglesham', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0), 
('2024-12-22 17:00:00', 61, 'Tymothy Yurenev', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-12-22 15:45:45', 62, 'Tremayne Broadberry', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0), 
('2024-12-22 14:45:30', 60, 'Boy Eaglesham', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.0), 
('2024-12-22 17:00:00', 61, 'Tymothy Yurenev', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-12-22 15:45:45', 62, 'Tremayne Broadberry', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Completed', 0.0), 
('2024-07-15 15:30:15', 50, 'Rena Millier', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-11-21 16:15:20', 51, 'Kissiah Raspison', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.0), 
('2024-06-08 14:45:30', 50, 'Rena Millier', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.0), 
('2024-03-12 17:00:00', 52, 'Renate Hovey', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-05-25 08:30:00', 53, 'Roxie Ellington', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.075), 
('2024-11-18 16:15:00', 54, 'Reidar Steen', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0), 
('2024-08-07 08:15:00', 55, 'Joline McKerron', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-07-28 16:30:00', 56, 'Raymund Charman', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.025), 
('2024-09-10 08:00:00', 57, 'Ulrikaumeko Howship', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.100), 
('2024-05-11 16:45:00', 58, 'Che Picker', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Processing', 0.075), 
('2024-11-23 07:45:00', 59, 'Den Dolbey', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0), 
('2024-06-16 17:00:00', 60, 'Boy Eaglesham', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.050), 
('2024-08-27 07:30:00', 61, 'Tymothy Yurenev', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.025), 
('2024-10-04 17:15:00', 62, 'Tremayne Broadberry', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0901234567', 'Processing', 0.100), 
('2024-05-09 07:15:00', 63, 'Justinn Klain', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.075), 
('2024-11-13 17:30:00', 64, 'Lita Di Franceshci', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Processing', 0), 
('2024-07-01 07:00:00', 65, 'Burt Boothebie', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.050), 
('2024-09-26 17:45:00', 66, 'Tani McGilvra', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.025), 
('2024-09-08 17:00:00', 70, 'Bucky Labbet', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.100), 
('2024-04-25 15:00:10', 71, 'Michele Fellenor', '456 Cong Quynh Street, District 1, Ho Chi Minh City', '0956789012', 'Completed', 0.00),
('2024-10-17 16:45:35', 72, 'Leicester Peracco', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', '0934567890', 'Processing', 0.03), 
('2024-06-01 15:30:15', 73, 'Tallie Bainton', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-12-10 16:15:20', 74, 'Robenia Durbin', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0.00), 
('2024-07-03 18:30:00', 75, 'Ettie Gregine', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.100),
('2024-09-17 06:00:00', 76, 'Ferdie Lamdin', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.075), 
('2024-06-13 11:30:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.03), 
('2024-09-21 14:00:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.05), 
('2024-05-07 10:15:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.025), 
('2024-11-26 13:45:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0), 
('2024-08-18 10:00:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.1), 
('2024-07-25 14:15:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.075), 
('2024-10-03 09:45:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0), 
('2024-06-20 15:00:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.05), 
('2024-09-10 09:30:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.025), 
('2024-05-01 15:15:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.10), 
('2024-11-12 09:15:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.08), 
('2024-08-05 15:30:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0), 
('2024-07-15 09:00:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.03), 
('2024-09-21 15:45:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.05), 
('2024-06-08 08:45:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.025), 
('2024-10-12 16:00:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.10), 
('2024-05-25 08:30:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.075), 
('2024-11-18 16:15:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0), 
('2024-08-07 08:15:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.05), 
('2024-07-28 16:30:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.025), 
('2024-09-10 08:00:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.10), 
('2024-05-11 16:45:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.075), 
('2024-11-23 07:45:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.000), 
('2024-06-16 17:00:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.050), 
('2024-08-27 07:30:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.025), 
('2024-10-04 17:15:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.100), 
('2024-05-09 07:15:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.075), 
('2024-11-13 17:30:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.000), 
('2024-08-07 08:15:00', 7, 'Kakalina Bayliss', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.05), 
('2024-07-28 16:30:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.025), 
('2024-09-10 08:00:00', 3, 'Hank Tabour', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.100), 
('2024-05-11 16:45:00', 1, 'Emilia Dunsford', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.075), 
('2024-11-23 07:45:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.000), 
('2024-06-16 17:00:00', 3, 'Hank Tabour', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.050), 
('2024-08-27 07:30:00', 7, 'Kakalina Bayliss', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.025), 
('2024-10-04 17:15:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.100), 
('2024-05-09 07:15:00', 3, 'Hank Tabour', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.075),
('2024-11-13 17:30:00', 7, 'Kakalina Bayliss', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0), 
('2024-07-01 07:00:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.05), 
('2024-09-26 17:45:00', 3, 'Hank Tabour', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.025), 
('2024-06-20 06:45:00', 7, 'Kakalina Bayliss', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.100), 
('2024-10-02 18:00:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.075), 
('2024-05-14 06:30:00', 3, 'Hank Tabour', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0),
('2024-11-05 18:15:00', 17, 'Leese Cromb', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.05), 
('2024-08-22 06:15:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.025), 
('2024-07-03 18:30:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.1), 
('2024-09-17 06:00:00', 17, 'Leese Cromb', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.075), 
('2024-05-28 18:45:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0), 
('2024-12-22 05:45:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.05), 
('2024-12-22 19:00:00', 17, 'Leese Cromb', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.025), 
('2024-12-22 05:30:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.1), 
('2024-12-22 19:15:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.075), 
('2024-12-22 05:15:00', 17, 'Leese Cromb', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0), 
('2024-12-22 19:30:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.05), 
('2024-12-22 05:00:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.025), 
('2024-07-15 19:45:00', 30, 'Maiga Stennett', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.100), 
('2024-09-24 04:45:00', 31, 'Katine Corness', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.075), 
('2024-06-10 20:00:00', 32, 'Berkly Switland', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0), 
('2024-08-28 04:30:00', 33, 'Brien Hearty', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.050), 
('2024-11-17 20:15:00', 34, 'Winna MacRirie', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.025), 
('2024-09-05 04:15:00', 35, 'Devin Brighouse', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.100), 
('2024-10-23 20:30:00', 36, 'Wilfrid Suermeier', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.075),   
('2024-05-11 04:00:00', 37, 'Lonni Semeradova', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0), 
('2024-08-06 20:45:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.05), 
('2024-07-29 03:45:00', 39, 'Cornell St Ledger', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.025), 
('2024-10-02 21:00:00', 40, 'Ermanno Winning', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.10), 
('2024-06-19 03:30:00', 30, 'Maiga Stennett', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.075), 
('2024-07-15 15:30:15', 1, 'Emilia Dunsford', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0.05), 
('2024-11-21 16:15:20', 2, 'Max McConnachie', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', '0912345678', 'Processing', 0), 
('2024-06-08 14:45:30', 1, 'Emilia Dunsford', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', '0901234567', 'Completed', 0), 
('2024-03-12 17:00:00', 3, 'Hank Tabour', '234 Pasteur Street, District 1, Ho Chi Minh City', '0923456789', 'Processing', 0.025), 
('2024-05-25 08:30:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.075), 
('2024-11-18 16:15:00', 6, 'Colline Gwilliam', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0), 
('2024-08-07 08:15:00', 7, 'Kakalina Bayliss', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.05), 
('2024-07-28 16:30:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.025), 
('2024-09-10 08:00:00', 3, 'Hank Tabour', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.1), 
('2024-05-11 16:45:00', 1, 'Emilia Dunsford', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.075), 
('2024-11-23 07:45:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0), 
('2024-06-16 17:00:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.05), 
('2024-08-27 07:30:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.025), 
('2024-10-04 17:15:00', 15, 'Tristan Cruddace', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.1), 
('2024-05-09 07:15:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.075), 
('2024-11-13 17:30:00', 27, 'Concordia Rodgers', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0), 
('2024-07-03 18:30:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0), 
('2024-09-21 21:15:00', 17, 'Le Van I', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0), 
('2024-06-08 03:15:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.05), 
('2024-10-12 21:30:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0.025), 
('2024-05-25 03:00:00', 17, 'Le Van I', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Completed', 0.1), 
('2024-11-18 21:45:00', 5, 'Jaquenette Bowra', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Processing', 0.075), 
('2024-08-07 02:45:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0), 
('2024-07-28 22:00:00', 17, 'Le Van I', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.05), 
('2024-09-10 08:00:00', 3, 'Hank Tabour', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Completed', 0.1), 
('2024-05-11 16:45:00', 1, 'Emilia Dunsford', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0.075), 
('2024-07-03 18:30:00', 38, 'Oates Palin', '456 Hai Ba Trung Street, District 1, Ho Chi Minh City', '0916789012', 'Processing', 0), 
('2024-09-21 21:15:00', 70, 'Bucky Labbet', '789 Nguyen Hue Street, District 1, Ho Chi Minh City', '0927890123', 'Processing', 0), 
('2024-06-08 03:15:00', 71, 'Michele Fellenor', '123 Le Thanh Ton Street, District 1, Ho Chi Minh City', '0905678901', 'Completed', 0.05) 
 select * from supplier_account
 
 insert into supplier_account(name, address, email, phone, password) values
('Artisan Village', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', 'artisanvillage.chusvn', '0901234567', 'artisan123'), 
('Bamboo Craftsman', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'bamboocraftsman.chusvn', '0912345678', 'bamboo123'), 
('Basket Weavers', '234 Pasteur Street, District 1, Ho Chi Minh City', 'basketweavers.chusvn', '0923456789', 'basket123'), 
('Beads & Beyond', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'beadsbeyond.chusvn', '0934567890', 'beads123'), 
('Blacksmith', '123 Le Duan Street, District 1, Ho Chi Minh City', 'blacksmith.chusvn', '0945678901', 'blacksmith123'), 
('Blacksmith Workshop', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'blacksmithworkshop.chusvn', '0956789012', 'blacksmithw123'), 
('Ceramic Artist', '234 Pasteur Street, District 1, Ho Chi Minh City', 'ceramicartist.chusvn', '0967890123', 'ceramic123'), 
('Clay Creations', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'claycreations.chusvn', '0978901234', 'clay123'), 
('Cozy Knits', '123 Le Duan Street, District 1, Ho Chi Minh City', 'cozyknits.chusvn', '0989012345', 'cozy123'), 
('Embroidery Artist', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'embroideryartist.chusvn', '0990123456', 'embroidery123'), 
('Embroidery Emporium', '234 Pasteur Street, District 1, Ho Chi Minh City', 'embroideryemporium.chusvn', '0901234567', 'embro123'), 
('Etsy Seller', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'etsyseller.chusvn', '0912345678', 'etsy123'), 
('Fair Trade Workshop', '123 Le Duan Street, District 1, Ho Chi Minh City', 'fairtradeworkshop.chusvn', '0923456789', 'fairtrade123'), 
('Florist', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'florist.chusvn', '0934567890', 'florist123'), 
('Flower Presser', '234 Pasteur Street, District 1, Ho Chi Minh City', 'flowerpresser.chusvn', '0945678901', 'flower123'), 
('Glass Recyclers', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'glassrecyclers.chusvn', '0956789012', 'glassrec123'), 
('Glassworks Studio', '123 Le Duan Street, District 1, Ho Chi Minh City', 'glassworksstudio.chusvn', '0967890123', 'glass123'), 
('Green Creations', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'greencreations.chusvn', '0978901234', 'green123'), 
('Indigenous Community', '234 Pasteur Street, District 1, Ho Chi Minh City', 'indigenouscommunity.chusvn', '0989012345', 'indigen123'), 
('Knitting Circle', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'knittingcircle.chusvn', '0990123456', 'knitcircle123'), 
('Knitting Workshop', '123 Nguyen Trai Street, District 1, Ho Chi Minh City', 'knittingworkshop.chusvn', '0901234567', 'knit123'), 
('Knotty Creations', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'knottycreations.chusvn', '0912345678', 'knotty123'), 
('Leather Artisan', '234 Pasteur Street, District 1, Ho Chi Minh City', 'leatherartisan.chusvn', '0923456789', 'leather123'), 
('Leatherworker', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'leatherworker.chusvn', '0934567890', 'leather456'), 
('Leatherworks Co.', '123 Le Duan Street, District 1, Ho Chi Minh City', 'leatherworksco.chusvn', '0945678901', 'leather789'), 
('Macrame Artist', '456 Cong Quynh Street, District 1, Ho Chi Minh City', 'macrameartist.chusvn', '0956789012', 'macrame123'), 
('Metal Craftsman', '123 Pasteur Street, District 1, Ho Chi Minh City', 'metalcraftsman.chusvn', '0967890123', 'metal123'), 
('Natural Dyes Workshop', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'naturaldyesworkshop.chusvn', '0978901234', 'natural123'), 
('Potter', '123 Le Duan Street, District 1, Ho Chi Minh City', 'potter.chusvn', '0989012345', 'potter123'), 
('Pottery Studio', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'potterystudio.chusvn', '0990123456', 'pottery123'), 
('Rattan Weaver', '234 Pasteur Street, District 1, Ho Chi Minh City', 'rattanweaver.chusvn', '0901234567', 'rattan123'), 
('Rattan Weavers', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'rattanweavers.chusvn', '0912345678', 'rattan456'), 
('Rug Weaver', '123 Le Duan Street, District 1, Ho Chi Minh City', 'rugweaver.chusvn', '0923456789', 'rug123'), 
('Rug Weavers', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'rugweavers.chusvn', '0934567890', 'rug456'), 
('Silk Painter', '234 Pasteur Street, District 1, Ho Chi Minh City', 'silkpainter.chusvn', '0945678901', 'silk123'), 
('Soap Maker', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'soapmaker.chusvn', '0956789012', 'soap123'), 
('Tile Maker', '123 Le Duan Street, District 1, Ho Chi Minh City', 'tilemaker.chusvn', '0967890123', 'tile123'), 
('Upcycled Crafts', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'upcycledcrafts.chusvn', '0978901234', 'upcycle123'), 
('Urban Craft Co.', '234 Pasteur Street, District 1, Ho Chi Minh City', 'urbancraftco.chusvn', '0989012345', 'urban123'), 
('Village Cooperative', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'villagecooperative.chusvn', '0990123456', 'village123'), 
('Wood Carver', '123 Le Duan Street, District 1, Ho Chi Minh City', 'woodcarver.chusvn', '0901234567', 'woodcarv123'), 
('Wood Toy Maker', '567 Vo Van Tan Street, District 3, Ho Chi Minh City', 'woodtoymaker.chusvn', '0912345678', 'woodtoy123'),
('Woodcrafters Inc.', '234 Pasteur Street, District 1, Ho Chi Minh City', 'woodcraftersinc.chusvn', '0923456789', 'woodcraft123'), 
('Wooden Wonders', '789 Tran Hung Dao Street, District 5, Ho Chi Minh City', 'woodenwonders.chusvn', '0934567890', 'wooden123'),
 insert into supplier_account(name, address, email, phone, password) values

('Woodworker', '702 Nguyen Van Linh Street, District 7, Ho Chi Minh City', 'woodworker.chusvn', '0284937423', 'woodworker123') ; 

Insert into rejected_item(product_id, reason) values 
(3, "price is not suitable") ,
(6, "Woven Basket: Weave is loose and uneven, posing a potential hazard."), 
(9, "Hand-Painted Silk Scarf: Color bleeding observed after initial wash."), 
(12, "Hand-Woven Rug: Uneven edges and loose threads, affecting overall appearance."),
(15, "Bamboo Flute: Cracks in the bamboo affecting sound quality and durability.") ,
(18, "Hand-Painted Porcelain Teacup & Saucer Set: Chips and cracks in the porcelain.") ,
(21, "Hand-Painted Wooden Toys: Paint peeling and chipping, posing a safety hazard for children.") ,
(24, "Leather-Crafted Belt: Leather is stiff and uncomfortable to wear.") ,
(27, "Macrame Plant Hanger: Uneven knots and loose ends, affecting the overall aesthetic.") ,
(30, "Hand-Painted Ceramic Tiles: Uneven glaze application and visible imperfections.") ,
(33, "Hand-Woven Rug Runner: Frayed edges and loose threads, reducing durability.") ,
(36, "Bamboo Bird Feeder: Poorly constructed, likely to fall apart easily."),
(39, "Hand-Painted Porcelain Teapot: Cracked glaze, potentially leaking water.") ,
(42, "Hand-Painted Wooden Toys: Sharp edges and unfinished surfaces, posing a safety hazard.") ,
(45, "Leather-Crafted Wallet: Poorly stitched seams, likely to come apart easily.") ,
(48, "Macrame Dream Catcher: Loose and uneven knots, affecting the overall appearance.") ,
(51, "Hand-Painted Ceramic Wall Plaques: Uneven paint application and visible imperfections.") ,
(54, "Hand-Woven Rug Runner: Uneven weaving and inconsistent thickness.") ,
(57, "Bamboo Bird Feeder: Poorly constructed, likely to fall apart easily.") ,
(60, "Hand-Painted Porcelain Teapot: Chips in the spout, affecting functionality.") ,
(63, "Hand-Painted Wooden Toys: Paint chipping and peeling, posing a safety hazard for children.") ,
(66, "Leather-Crafted Wallet: Zipper malfunctioning, making it difficult to use.") ,
(69, "Macrame Dream Catcher: Loose and uneven knots, affecting the overall appearance.") ,
(72, "Hand-Painted Ceramic Wall Plaques: Uneven glaze application and visible imperfections.") ,
(75, "Hand-Woven Rug: Uneven weaving and inconsistent thickness, affecting the overall appearance.") ,
(78, "Bamboo Wind Chimes: Unevenly cut bamboo pieces, affecting the sound quality.") ,
(81, "Hand-Painted Porcelain Dinnerware Set: Chips and cracks in the porcelain, posing a safety hazard.") ,
(84, "Hand-Painted Wooden Puzzles: Pieces do not fit together properly, affecting gameplay.") ,
(87, "Leather-Crafted Journal Cover: Leather is too stiff and difficult to open.") ,
(90, "Macrame Wall Hanging: Uneven knots and loose ends, affecting the overall aesthetic.") ,
(93, "Hand-Painted Ceramic Mug: Cracked glaze, potentially leaking liquid.") ,
(96, "Hand-Forged Iron Candlesticks: Uneven surface and sharp edges, posing a potential hazard.") ,
(99, "Woven Basket: Loose and uneven weave, affecting the overall stability.") ,
(102, "Hand-Painted Silk Scarf: Color fading after a short period of time.") ,
(105, "Hand-Woven Rug: Uneven weaving and inconsistent thickness, affecting the overall appearance.") ,
(108, "Beaded Necklace: Loose beads and weak string, posing a choking hazard.") ,
(114, "Glass Blown Bird: Air bubbles and imperfections in the glass.") ,
(120, "Macrame Plant Hanger: Uneven knots and loose ends, affecting the overall appearance.") ,
(126, "Recycled Bottle Candle Holder: Uneven edges and potential for glass shards.") ,
(130, "Macrame Dream Catcher: Loose and uneven knots, affecting the overall appearance.") ,
(136, "Recycled Tin Can Planter: Sharp edges and potential for rusting.") ,
(140, "Macrame Keychain: Loose knots and weak string, likely to break easily.") ,
(146, "Recycled Plastic Bottle Flower Vase: Uneven cuts and potential for sharp edges.") ,
(150, "Macrame Wall Hanging: Uneven knots and loose ends, affecting the overall aesthetic.") ,
(156, "Recycled Cardboard Box Organizer: Flimsy construction and potential for tearing.") ,
(160, "Macrame Plant Hanger: Uneven knots and loose ends, affecting the overall appearance.") ,
(166, "Recycled Plastic Bottle Flower Vase: Uneven cuts and potential for sharp edges.");

select * from orders;

insert into buy(order_id, product_id, quantity) values 
(1, 1, 2), (2, 4, 1), (3, 7, 3), (4, 10, 2), (5, 13, 1), 
(6, 16, 3), (7, 19, 2), (8, 22, 1), (9, 25, 3), (10, 28, 2), 
(11, 31, 1), (12, 34, 3), (13, 37, 2), (14, 40, 1), (15, 43, 3), 
(16, 46, 2), (17, 49, 1), (18, 52, 3), (19, 55, 2), (20, 58, 1), 
(21, 61, 3), (22, 64, 2), (23, 67, 1), (24, 70, 3), (25, 73, 2), 
(26, 76, 1), (27, 79, 3), (28, 82, 2), (29, 85, 1), (30, 88, 3), 
(31, 91, 2), (32, 94, 1), (33, 97, 3), (34, 100, 2), (35, 103, 1), 
(36, 106, 3), (37, 109, 2), (38, 111, 1), (39, 113, 3), (40, 115, 2), 
(41, 117, 2), (42, 119, 1), (43, 121, 3), (44, 123, 2), (45, 125, 1), 
(46, 127, 3), (47, 129, 2), (48, 131, 1), (49, 133, 3), (50, 135, 2), 
(51, 137, 1), (52, 139, 3), (53, 141, 2), (54, 143, 1), (55, 145, 3), 
(56, 147, 2), (57, 149, 1), (58, 151, 3), (59, 153, 2), (60, 155, 1), 
(61, 157, 3), (62, 159, 2), (63, 161, 1), (64, 163, 3), (65, 165, 2), 
(66, 167, 1), (67, 1, 3), (68, 4, 2), (69, 7, 1), (70, 10, 3), (71, 13, 2), 
(72, 16, 1), (73, 19, 3), (74, 22, 2), (75, 25, 1), (76, 28, 3), (77, 31, 2), 
(78, 34, 1), (79, 37, 3), (80, 40, 2), (81, 43, 1), (81, 46, 3), (1, 49, 2), 
(1, 52, 1), (2, 55, 3), (2, 58, 2), (2, 61, 1), (3, 64, 3), (3, 67, 2), 
(5, 70, 1), (5, 73, 3), (12, 76, 2), (11, 79, 1), (22, 82, 3), (22, 85, 2), 
(6, 88, 1), (6, 91, 3), (7, 94, 2), (3, 97, 1), (1, 100, 3), (2, 1, 2), 
(18, 4, 1), (13, 7, 3), (14, 10, 2), (15, 13, 1), (16, 16, 3), (10, 19, 2), 
(18, 22, 1), (19, 25, 3), (11, 28, 2), (11, 31, 1), (11, 34, 3), (13, 37, 2), 
(14, 40, 1), (20, 43, 3), (20, 46, 2), (20, 49, 1), (21, 52, 3), (24, 55, 2), 
(20, 58, 1), (51, 61, 3), (12, 64, 2), (43, 67, 1), (35, 70, 3), (38, 73, 2), 
(26, 76, 1), (27, 79, 3), (28, 82, 2), (43, 85, 1), (37, 88, 3), (41, 91, 2), 
(76, 94, 1), (10, 97, 3), (2, 100, 2), (8, 103, 1), (9, 106, 3), (18, 109, 2), 
(38, 111, 1), (39, 113, 3), (40, 115, 2), (29, 1, 2), (28, 4, 1), (21, 7, 3), 
(44, 10, 2), (45, 13, 1), (46, 16, 3), (47, 19, 2), (48, 22, 1), (49, 25, 3), 
(56, 28, 2), (53, 31, 1), (49, 34, 3), (52, 37, 2), (70, 40, 1), (60, 43, 3), 
(57, 46, 2), (17, 49, 1), (18, 52, 3), (69, 55, 2), (72, 58, 1), (61, 61, 3),
(62, 64, 2), (64, 67, 1), (19, 70, 3), (20, 73, 2), (81, 76, 1), (84, 79, 3), 
(48, 82, 2), (47, 85, 1), (44, 88, 3), (42, 91, 2), (80, 94, 1), (80, 97, 3), 
(74, 100, 2), (75, 103, 1), (11, 106, 3), (19, 109, 2), (33, 111, 1), (40, 113, 3), 
(80, 115, 2), (10, 10, 2), (21, 13, 1), (20, 16, 3), (37, 19, 2), (39, 22, 1), 
(79, 25, 3), (43, 28, 2), (49, 31, 1), (37, 34, 3), (36, 37, 2), (38, 40, 1),
 (34, 43, 3), (29, 46, 2), (24, 49, 1), (39, 52, 3), (40, 55, 2), (39, 58, 1), 
 (35, 61, 3), (39, 64, 2), (57, 67, 1); 
 
 select * from orders
  
insert into buy(order_id, product_id, quantity) values 
(82, 16, 2), (83, 4, 1), (84, 7, 3), (85, 10, 2), (86, 13, 1), (87, 16, 3), (88, 19, 2), (89, 22, 1), (90, 25, 3), (91, 28, 2), (92, 31, 1), (93, 34, 3), (94, 37, 2), (95, 40, 1), (96, 43, 3), (97, 46, 2), (98, 49, 1), (99, 52, 3), (100, 55, 2), (82, 58, 1), (92, 16, 2), (93, 4, 1), (94, 7, 3), (95, 10, 2), (96, 13, 1), (97, 16, 3), (98, 19, 2), (99, 22, 1), (100, 25, 3), (92, 28, 2), (101, 31, 1), (102, 34, 3), (103, 37, 2), (104, 40, 1), (105, 43, 3), (106, 46, 2), (107, 49, 1), (108, 52, 3), (109, 55, 2), (110, 58, 1), (102, 16, 2), (103, 19, 1), (104, 22, 3), (105, 25, 2), (106, 28, 1), (107, 31, 3), (108, 34, 2), (109, 37, 1), (110, 40, 3), (111, 43, 2), (112, 46, 1), (113, 49, 3), (114, 52, 2), (115, 55, 1), (116, 58, 3), (117, 61, 2), (118, 64, 1), (119, 67, 3), (120, 70, 2), (102, 73, 1), (132, 10, 2), (133, 13, 1), (134, 16, 3), (135, 19, 2), (136, 22, 1), (137, 25, 3), (138, 28, 2), (139, 31, 1), (140, 34, 3), (141, 37, 2), (142, 40, 1), (143, 43, 3), (144, 46, 2), (145, 49, 1), (146, 52, 3), (147, 55, 2), (148, 58, 1), (149, 61, 3), (150, 64, 2), (132, 67, 1), (133, 70, 3), (134, 73, 2), (135, 76, 1), (136, 79, 3), (137, 82, 2), (138, 85, 1), (139, 88, 3), (140, 91, 2), (141, 94, 1), (142, 97, 3), (143, 100, 2), (144, 103, 1), (145, 106, 3), (146, 109, 2), (147, 111, 1), (148, 113, 3), (149, 115, 2), (150, 117, 1), (132, 119, 3), (133, 121, 2), (134, 123, 1), (135, 125, 3), (136, 127, 2), (137, 129, 1), (138, 131, 3), (139, 133, 2), (140, 135, 1), (141, 137, 3), (142, 139, 2), (143, 141, 1), (144, 143, 3), (145, 145, 2), (146, 147, 1), (147, 149, 3), (148, 151, 2), (149, 153, 1), (150, 155, 3), (152, 10, 2), (153, 13, 1), (154, 16, 3), (155, 19, 2), (156, 22, 1), (157, 25, 3), (158, 28, 2), (159, 31, 1), (160, 34, 3), (161, 37, 2), (162, 40, 1), (163, 43, 3), (164, 46, 2), (165, 49, 1), (166, 52, 3), (167, 55, 2), (168, 58, 1), (169, 61, 3), (170, 64, 2), (171, 67, 1), (172, 70, 3), (173, 73, 2), (174, 76, 1), (175, 79, 3), (176, 82, 2), (177, 85, 1), (178, 88, 3), (179, 91, 2), (180, 94, 1), (152, 97, 3), (153, 100, 2), (154, 103, 1), (155, 106, 3), (156, 109, 2), (157, 111, 1), (158, 113, 3), (159, 115, 2), (160, 117, 1), (161, 119, 3), (162, 121, 2), (163, 123, 1), (164, 125, 3), (165, 127, 2), (166, 129, 1), (167, 131, 3), (168, 133, 2), (169, 135, 1), (170, 137, 3), (171, 139, 2), (172, 141, 1), (173, 143, 3), (174, 145, 2), (175, 147, 1), (176, 149, 3), (177, 151, 2), (178, 153, 1), (179, 155, 3), (180, 157, 2), (192, 10, 2), (193, 13, 1), (194, 16, 3), (195, 19, 2), (196, 22, 1), (197, 25, 3), (198, 28, 2), (199, 31, 1), (200, 34, 3), (201, 37, 2), (202, 40, 1), (203, 43, 3), (204, 46, 2), (205, 49, 1), (206, 52, 3), (207, 55, 2), (208, 58, 1), (209, 61, 3), (210, 64, 2), (211, 67, 1), (212, 70, 3), (213, 73, 2), (214, 76, 1), (192, 79, 3), (193, 82, 2), (194, 85, 1), (195, 88, 3), (196, 91, 2), (197, 94, 1), (198, 97, 3), (199, 100, 2), (200, 103, 1), (201, 106, 3), (202, 109, 2), (203, 111, 1), (204, 113, 3), (205, 115, 2), (206, 117, 1), (207, 119, 3), (208, 121, 2), (209, 123, 1), (210, 125, 3), (211, 127, 2), (212, 129, 1), (213, 131, 3), (214, 133, 2), (192, 135, 1), (193, 137, 3), (194, 139, 2), (195, 141, 1), (196, 143, 3), (197, 145, 2), (198, 147, 1), (199, 149, 3), (200, 151, 2), (201, 153, 1), (202, 155, 3), (203, 157, 2), (204, 159, 1), (205, 161, 3), (206, 163, 2), (207, 165, 1), (208, 167, 3), (209, 169, 2), (210, 1, 1), (211, 4, 3), (212, 7, 2), (213, 10, 1), (214, 13, 3), (192, 16, 2), (193, 19, 1), (194, 22, 3), (195, 25, 2), (196, 28, 1), (197, 31, 3), (198, 34, 2), (199, 37, 1), (200, 40, 3), (201, 43, 2), (202, 46, 1), (203, 49, 3), (204, 52, 2), (205, 55, 1), (206, 58, 3), (207, 61, 2), (208, 64, 1), (209, 67, 3), (210, 70, 2), (211, 73, 1), (212, 76, 3), (213, 79, 2), (214, 82, 1), (192, 85, 3), (193, 88, 2), (194, 91, 1), (195, 94, 3), (196, 97, 2), (197, 100, 1), (198, 103, 3), (199, 106, 2), (200, 109, 1), (201, 111, 3), (202, 113, 2), (203, 115, 1), (204, 117, 3), (205, 119, 2), (206, 121, 1), (207, 123, 3), (208, 125, 2), (209, 127, 1), (210, 129, 3), (211, 131, 2), (212, 133, 1), (213, 135, 3), (214, 137, 2), (192, 139, 1), (193, 141, 3), (194, 143, 2), (195, 145, 1), (196, 147, 3), (197, 149, 2), (198, 151, 1), (199, 153, 3), (200, 155, 2), (201, 157, 1), (202, 159, 3), (203, 161, 2), (204, 163, 1), (205, 165, 3), (206, 167, 2), (207, 169, 1), (208, 1, 3), (209, 4, 2), (210, 7, 1), (211, 10, 3), (212, 13, 2), (213, 16, 1), (214, 19, 3), (192, 22, 2); 
 
 select count(distinct product_id) from product
 where approved_status = "Approved";
 
-- insert the all information of the product, which have been approved, from Product main table to item_on_sale 
INSERT INTO item_on_sale
SELECT product_id, product_name, supplier, product_size, category, quantity, unit_price
FROM product
where approved_status = "Approved";
 
-- To sign up, user input the phone or email as the userid, then provide password. 
-- If it's correctly matched to signed up information, the system will get the information based on relevant the unique customer id for each customer
-- sample for sign_up process: user provide email 'kraspison1m@g.co' as the user id and password 'kraspison1m';
select CB.customerid, name, phone_number, email, bank_name, bank_number number from customer_account C, customer_bank_account CB
where C.customerid = CB.customerid and email = 'kraspison1m@g.co' and password ='kraspison1m';

select * from customer_account
select * from customer_bank_account;
select * from buy
order by order_id;
select * from item_on_sale;
select order_id, date_format(order_datetime, "%m-%d-%Y" ) as order_datetime, 
customer_id, customer_name, customer_address, customer_phone, order_status, discount from orders;
select * from product;
select * from rejected_item;
select * from supplier_account;
select * from supplier_bank_account;

select product_id, product_name, category, quantity, product_size, supplier_account.supplierid as supplier, unit_price, approved_status from product, supplier_account 
where product.supplier = supplier_account.name
