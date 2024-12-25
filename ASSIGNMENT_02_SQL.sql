SET FOREIGN_KEY_CHECKS=0


create table customer_account (
	customerid int auto_increment,
    primary key(customerid),
    name varchar(50),
    phone_number varchar(30),
    email varchar(50), 
    password varchar(20)
);
   
alter table customer_bank_account(
	constraint fk_customerid_bank foreign key (customer_account) references customer_account(customerid)
    on delete cascade
    on update cascade
);
   
select * from customer_account;

alter table customer 
	drop column address;
insert into customer (name, address, email, phone, password) values ('Emilia Dunsford', 'Scott', 'edunsford0@canalblog.com', '838-232-1446','edunsford0');
insert into customer (name, address, email, phone, password) values ('Max McConnachie', 'Cambridge', 'mmcconnachie1@washingtonpost.com', '798-485-9892', 'mmconnachie1');
insert into customer (name, address, email, phone, password) values ('Hank Tabour', 'Ronald Regan', 'htabour2@posterous.com', '546-328-1116','htabour2');
insert into customer (name, address, email, phone, password) values ('Wes Haggerstone', 'Anniversary', 'whaggerstone3@kickstarter.com', '242-505-5789','whaggerstone3');
insert into customer (name, address, email, phone, password) values ('Jaquenette Bowra', 'Hallows', 'jbowra4@disqus.com', '118-143-4313','jbowra4');
insert into customer (name, address, email, phone, password) values ('Colline Gwilliam', 'Magdeline', 'cgwilliam5@blinklist.com', '919-939-6466','cgwilliam5');
insert into customer (name, address, email, phone, password) values ('Kakalina Bayliss', 'Arrowood', 'kbayliss6@nature.com', '810-448-3082','kbayliss6');
insert into customer (name, address, email, phone,password) values ('Sherilyn Edds', 'Katie', 'sedds7@bloglovin.com', '453-216-3173','sedds7');
insert into customer (name, address, email, phone,password) values('Theodore Jennaroy', 'Westend', 'tjennaroy8@amazonaws.com', '934-206-3164','tjennaroy8');
insert into customer (name, address, email, phone,password) values('Elicia Buckthought', 'Kenwood', 'ebuckthought9@marketwatch.com', '346-215-1183','ebuckthought9'),
('Hinda Vedyashkin', 'Garrison', 'hvedyashkinc@blogs.com', '424-617-9479', 'hvedyashkinc'), ('Marty Radolf', 'Grover', 'mradolfd@irs.gov', '806-986-5074', 'mradolfd'),
('Laurianne Lyon', 'International', 'llyone@epa.gov', '391-727-1663','llyone'),('Earle Dunnet', 'Dennis', 'edunnetf@mayoclinic.com', '994-941-6395', 'edunnetf'),
('Tristan Cruddace', 'Menomonie', 'tcruddaceg@mlb.com', '974-432-8365', 'tcruddaceg'),
('Flss Brass', 'Havey', 'fbrassh@jiathis.com', '995-339-8722','fbrassh'),
('Leese Cromb', 'Charing Cross', 'lcrombi@sina.com.cn', '452-593-0492','lcrombi'),
('Maudie Diddams', 'Ryan', 'mdiddamsj@narod.ru', '880-491-4794','mdiddamsj'),
('Tilly Hollyar', 'Atwood', 'thollyark@aboutads.info', '647-759-3260','thoyyyark'),
('Fitz Ferroni', 'Green Ridge', 'fferronil@addthis.com', '141-626-2674', 'fferronil'),
('Robina Trainor', 'Dapin', 'rtrainorm@hibu.com', '659-456-4879', 'rtrainorm'),
('Eugene Daynter', 'Basil', 'edayntern@ezinearticles.com', '113-727-3027', 'edayntern'),
('Trixy Le Noire', 'Bartillon', 'tleo@chron.com', '492-926-0482', 'tleo'),
('Web Honnan', 'Westridge', 'whonnanp@xing.com', '170-376-2548', 'whonnanp'),
('Irina Woodus', 'Claremont', 'iwoodusq@apple.com', '272-177-8032', 'iwoodusq'),
('Mada Davys', 'Dahle', 'mdavysr@dailymail.co.uk', '367-995-7794', 'mdavysr'),
('Concordia Rodgers', 'Rieder', 'crodgerss@exblog.jp', '282-866-1116', 'crodgerss'),
('Rowland Algate', 'Fieldstone', 'ralgatet@nbcnews.com', '703-113-0581', 'ralgatet'),
('Leroy Pedycan', 'Kim', 'lpedycanu@wired.com', '767-246-5005', 'lpedycanu'), ('Maiga Stennett', 'Carioca', 'mstennettv@altervista.org', '460-969-5244', 'mstennettv'), 
('Katine Corness', 'Roxbury', 'kcornessw@creativecommons.org', '184-115-9373', 'kcornessw'), 
('Berkly Switland', 'Morning', 'bswitlandx@stumbleupon.com', '135-458-2450', 'bswitlandx'), 
('Brien Hearty', 'Heath', 'bheartyy@eepurl.com', '552-861-5499', 'bheartyy'), 
('Winna MacRirie', 'Rowland', 'wmacririez@cbsnews.com', '158-305-0522', 'wmacririez'), 
('Devin Brighouse', 'Red Cloud', 'dbrighouse10@unicef.org', '320-610-2620', 'dbrighouse10'), 
('Wilfrid Suermeier', 'Ramsey', 'wsuermeier11@wordpress.com', '614-134-2789', 'wsuermeier11'), 
('Lonni Semeradova', 'Maple', 'lsemeradova12@pen.io', '686-367-2522', 'lsemeradova12'), 
('Oates Palin', 'Grover', 'opalin13@eepurl.com', '594-572-1319', 'opalin13'),
('Cornell St Ledger', 'Gina', 'cst1a@multiply.com', '628-978-3107', 'cst1a'), 
('Ermanno Winning', 'Fremont', 'ewinning1b@fastcompany.com', '723-890-0539', 'ewinning1b'), 
('Jock Murray', 'Chinook', 'jmurray1c@sciencedaily.com', '762-746-0227', 'jmurray1c'), 
('Darn Eddisford', 'Mcguire', 'deddisford1d@lycos.com', '995-225-8703', 'deddisford1d'), 
('Isadore Jimmes', 'Debra', 'ijimmes1e@zdnet.com', '927-793-6591', 'ijimmes1e'), 
('Gypsy Stubbe', 'Jenifer', 'gstubbe1f@photobucket.com', '311-223-6103', 'gstubbe1f'), 
('Wenda Curmi', 'Granby', 'wcurmi1g@exblog.jp', '712-595-4786', 'wcurmi1g'), 
('Lianne Fiennes', 'Maryland', 'lfiennes1h@amazon.co.uk', '219-977-5408', 'lfiennes1h'), 
('Guenevere McRavey', 'Hudson', 'gmcravey1i@google.nl', '463-344-9835', 'gmcravey1i'), 
('Sergeant Foxten', 'Mitchell', 'sfoxten1j@woothemes.com', '951-324-5779', 'sfoxten1j'),
('Michale Winham', 'Dakota', 'mwinham1k@google.fr', '868-608-9068', 'mwinham1k'), 
('Rena Millier', 'Trailsway', 'rmillier1l@prweb.com', '793-765-9073', 'rmillier1l'), 
('Kissiah Raspison', 'Dottie', 'kraspison1m@g.co', '905-403-3557', 'kraspison1m'), 
('Renate Hovey', 'Killdeer', 'rhovey1n@geocities.jp', '853-329-7622', 'rhovey1n'), 
('Roxie Ellington', 'Schmedeman', 'rellington1o@microsoft.com', '756-864-4064', 'rellington1o'), 
('Reidar Steen', 'Reinke', 'rsteen1p@vkontakte.ru', '338-641-7697', 'rsteen1p'), 
('Joline McKerron', 'Kipling', 'jmckerron1q@reuters.com', '932-642-6830', 'jmckerron1q'), 
('Raymund Charman', 'Memorial', 'rcharman1r@jiathis.com', '393-557-4354', 'rcharman1r'), 
('Ulrikaumeko Howship', 'Grim', 'uhowship1s@twitter.com', '306-989-3419', 'uhowship1s'), 
('Che Picker', 'Mundane', 'cpicker1t@fotki.com', '862-254-7816', 'cpicker1t'),
('Den Dolbey', 'Dennis', 'ddolbey1u@wp.com', '251-174-9588','ddolbey1u'),
('Boy Eaglesham', 'Cardinal', 'beaglesham1v@vimeo.com', '205-127-2323','beaglesham1v'),
('Tymothy Yurenev', 'Cottonwood', 'tyurenev1w@msn.com', '971-421-2978','tyurenev1w'),
('Tremayne Broadberry', 'Forster', 'tbroadberry1x@google.es', '360-137-9261','tbroadberry1x'),
('Justinn Klain', 'Lake View', 'jklain1y@washington.edu', '159-659-0445', 'jklain1y'),
('Lita Di Franceshci', 'Mallard', 'ldi1z@indiegogo.com', '408-156-9952','ldi1z'),
('Burt Boothebie', 'Rockefeller', 'bboothebie20@skype.com', '990-957-3106','bboothebie20'),
('Tani McGilvra', 'Mcbride', 'tmcgilvra21@360.cn', '570-981-8745', 'tmcgilvra21'),
('Lurlene Cherrison', 'Chive', 'lcherrison22@wiley.com', '223-104-1683','lcherrison22'),
('Vonni Palfrey', 'Acker', 'vpalfrey23@smh.com.au', '648-318-0973','vpalfrey23'),
('Elisha Watkiss', 'Mifflin', 'ewatkiss24@mtv.com', '181-145-4068','ewatkiss24'),
('Bucky Labbet', 'Haas', 'blabbet25@boston.com', '178-927-3084','blabbet25'),
('Michele Fellenor', 'Gale', 'mfellenor26@google.com.hk', '818-238-9419','mfellenor26');
insert into customer (name, address, email, phone,password) values 
('Leicester Peracco', 'Columbus', 'lperacco27@oakley.com', '766-874-0123','lperacco27'),
('Tallie Bainton', 'Londonderry', 'tbainton28@ask.com', '619-698-9454','tbainton28'),
('Robenia Durbin', 'Lakewood Gardens', 'rdurbin29@xrea.com', '374-225-8140','rdurbin29'),
('Ettie Gregine', 'Bayside', 'egregine2a@baidu.com', '632-707-4745','egregine2a'),
('Ferdie Lamdin', 'Larry', 'flamdin2b@fastcompany.com', '840-650-9750','flamdin2b'),
('Gypsy McCroft', 'Maple Wood', 'gmccroft2c@hhs.gov', '461-744-2884','gmccroft2c'),
('Fredelia Kinningley', 'Vera', 'fkinningley2d@smh.com.au', '869-635-3860','fkinningley2d'),
('Maris Bidwell', '2nd', 'mbidwell2f@devhub.com', '762-436-2224','mbidwell2f'),
('Katherina Sullly', 'Trailsway', 'ksullly2g@ucoz.ru', '289-759-5280','ksullly2g'),
('Daren Money', 'Forest Dale', 'dmoney2h@sina.com.cn', '696-997-4548','dmoney2h'),
('Karilynn Backson', 'Melby', 'kbackson2j@plala.or.jp', '716-893-8028','kbackson2j'),
('Nolie Duffield', 'Weeping Birch', 'nduffield2k@example.com', '941-780-5898','nduffield2k'),
('Lotti Eynaud', 'Bellgrove', 'leynaud2l@dot.gov', '650-142-3337','leynaud2l'),
('Oran Tindley', 'Loftsgordon', 'otindley2m@biglobe.ne.jp', '335-580-3528','otindley2m'),
('Cherilyn Gitsham', 'Monterey', 'cgitsham2n@virginia.edu', '424-606-8702','cgitsham2n'),
('Temp Addy', 'Farwell', 'taddy2o@go.com', '831-327-1778','taddy2o'),
('Rosalinda Feavers', 'Goodland', 'rfeavers2p@1688.com', '971-158-2896','rfeavers2p'),
('Abbey Farmery', 'Dunning', 'afarmery2q@linkedin.com', '637-411-2594','afarmery2q'),
('Raynard Softley', 'Kings', 'rsoftley2r@bluehost.com', '523-999-2863','rsoftley2r'),
('Dael Mussotti', 'Monica', 'dmussotti2s@nature.com', '111-618-8398','dmussotti2s'),
('Pippy M''Quharge', 'Sunnyside', 'pmquharge2t@weebly.com', '739-638-1179','pmquharge2t'),
('Ketti Allibone', 'Carpenter', 'kallibone2u@dell.com', '208-651-9051','kallibone2u'),
('Jesus Stain', 'Macpherson', 'jstain2v@altervista.org', '197-151-3404','jstain2v'),
('Suzi Thorndale', 'Novick', 'sthorndale2w@cyberchimps.com', '366-973-2482','sthorndale2w'),
('Karylin Sabine', 'Rockefeller', 'ksabine2x@bloomberg.com', '752-856-8196','ksabine2x'),
('Gaylene Jillins', 'Cottonwood', 'gjillins2y@shinystat.com', '691-487-0746','gjillins2y'),
('Gladi Dobbinson', 'Raven', 'gdobbinson2z@reuters.com', '703-576-9709','gdobbinson2z'),
('Odetta Petrashkov', 'Fair Oaks', 'opetrashkov30@purevolume.com', '958-187-7101','opetrashkov30');

create table customer_bank_account(
	customerid numeric(4),
    bank_name varchar(50), 
    bank_number numeric(20)
);
 
 Insert into bank_account (customerid, bank_name, bank_number) values 
 (1, 'JPMorgan Chase Bank',  1234567890), (2, 'Bank of America',  9876543210), 
 (3, 'Citibank',  1357924680), (4, 'Wells Fargo',  2468013579), (5, 'HSBC',  5678901234), 
 (5, 'Deutsche Bank',  9012345678), (6, 'Barclays',  3579124680), (7, 'BNP Paribas',  7890123456), 
 (8, 'Credit Suisse',  2468013579), (8, 'UBS',  6789012345), (9, 'Bank of America', 1234567890), (10, 'Capital One', 1357924680), 
 (11, 'U.S. Bank', 1234567890), (12, 'PNC Bank', 9876543210);
 
Insert into bank_account (customerid, bank_name, bank_number) values (59, 'Bank of America', 1234567890),
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

-- To sign up, user input the phone or email as the userid, then provide password. 
-- If it's correctly matched to signed up information, the system will get the information based on relevant the unique customer id for each customer
-- sample for sign_up process: user provide email 'awilsteada@google.co.jp' as the user id and password 'awilstead';
select bank_account.customerid, name, phone, address, email, bank_name, bank_number number from customer, bank_account
where customer.customerid = bank_account.customerid and email = 'awilsteada@google.co.jp' and password ='awilstead';
 
Create table item_on_sale(
	product_id int auto_increment,
    primary key (product_id),
    product_name varchar(50), 
    category varchar(20),
    quantity numeric(3), 
    size varchar(20), 
    supplier varchar(40)
);

ALTER TABLE `assignment_2`.`product` 
DROP FOREIGN KEY `fk_supplier_product`;

Insert into item_on_sale (product_name, category, quantity, size, supplier) values
('Hand-Carved Wooden Bowl', 'Home Decor', 1, '8"', 'Local Artisan'),
('Woolen Knitted Scarf', 'Accessories', 5, '70 cm', 'Fair Trade Workshop'),
('Hand-Painted Ceramic Vase', 'Home Decor', 2, '12"', 'Pottery Studio'),
('Recycled Glass Jewelry Set', 'Accessories', 3, 'Various', 'Urban Craft Co.'),
('Macrame Wall Hanging', 'Home Decor', 1, '3 ft', 'Etsy Seller'),
('Hand-Forged Iron Candle Holder', 'Home Decor', 2, 'Small', 'Blacksmith Workshop'),
('Leather-Bound Journal', 'Stationery', 3, 'Medium', 'Leather Artisan'),
('Hand-Embroidered Cushion Covers', 'Home Decor', 4, '20x20"', 'Village Cooperative'),
('Woven Basket', 'Home Decor', 1, 'Large', 'Indigenous Community'),
('Hand-Turned Wooden Pen', 'Stationery', 5, 'Various', 'Woodworker'),
('Copper Tea Kettle', 'Kitchen', 1, '2 L', 'Metal Craftsman'),
('Hand-Painted Silk Scarf', 'Accessories', 2, 'Square', 'Silk Painter'),
('Rattan Furniture Set', 'Outdoors', 1, '2 Chairs & Table', 'Rattan Weavers'),
('Handmade Soap', 'Personal Care', 10, 'Various Scents', 'Soap Maker'),
('Hand-Woven Rug', 'Home Decor', 1, '8x10 ft', 'Rug Weavers'),
('Terracotta Flower Pots', 'Home Decor', 6, 'Small', 'Potter'),
('Hand-Carved Wooden Mask', 'Decorative Art', 1, 'Tribal Style', 'Wood Carver'),
('Bamboo Flute', 'Musical Instruments', 1, 'Traditional', 'Bamboo Craftsman'),
('Hand-Dyed Fabric', 'Textiles', 5, 'Various Colors', 'Natural Dyes Workshop'),
('Pressed Flower Greeting Cards', 'Stationery', 10, 'Assorted', 'Flower Presser'),
('Hand-Painted Porcelain Teacup & Saucer Set', 'Tableware', 2, 'Floral', 'Ceramic Artist'),
('Recycled Tire Swing', 'Outdoors', 1, 'Adult Size', 'Upcycled Crafts'),
('Hand-Knitted Baby Blanket', 'Baby', 1, 'Soft Wool', 'Knitting Circle'),
('Hand-Painted Wooden Toys', 'Toys', 3, 'Animals', 'Wood Toy Maker'),
('Dried Flower Arrangement', 'Home Decor', 1, 'Large', 'Florist'),
('Hand-Forged Iron Fire Poker', 'Fireplace', 1, 'Decorative', 'Blacksmith'),
('Leather-Crafted Belt', 'Accessories', 2, 'Hand-Tooled', 'Leatherworker'),
('Hand-Embroidered Wall Art', 'Home Decor', 1, 'Large Floral', 'Embroidery Artist'),
('Recycled Glass Bottles', 'Decorative Art', 6, 'Various Shapes', 'Glass Recyclers'),
('Macrame Plant Hanger', 'Home Decor', 3, 'Small', 'Macrame Artist'),
('Hand-Carved Wooden Chess Set', 'Games', 1, 'Intricate', 'Wood Carver'),
('Woolen Knitted Hat', 'Accessories', 4, 'Winter', 'Knitting Workshop'),
('Hand-Painted Ceramic Tiles', 'Home Decor', 10, 'Decorative', 'Tile Maker'),
('Rattan Chair', 'Furniture', 1, 'Single', 'Rattan Weaver'),
('Handmade Soap', 'Personal Care', 10, 'Lavender', 'Soap Maker'),
('Hand-Woven Rug Runner', 'Home Decor', 1, 'Hallway Size', 'Rug Weaver'),
('Terracotta Flower Pots', 'Home Decor', 6, 'Medium', 'Potter'),
('Hand-Carved Wooden Spoon', 'Kitchen', 5, 'Various Sizes', 'Wood Carver'),
('Bamboo Bird Feeder', 'Outdoors', 1, 'Hanging', 'Bamboo Craftsman'),
('Hand-Dyed Fabric', 'Textiles', 5, 'Indigo', 'Natural Dyes Workshop'),
('Pressed Flower Bookmarks', 'Stationery', 15, 'Assorted', 'Flower Presser'),
('Hand-Painted Porcelain Teapot', 'Tableware', 1, 'Floral', 'Ceramic Artist'),
('Recycled Tire Planter', 'Outdoors', 2, 'Large', 'Upcycled Crafts'),
('Hand-Knitted Baby Booties', 'Baby', 5, 'Soft Yarn', 'Knitting Circle'),
('Hand-Painted Wooden Toys', 'Toys', 3, 'Cars', 'Wood Toy Maker'),
('Dried Flower Bouquet', 'Home Decor', 1, 'Medium', 'Florist'),
('Hand-Forged Iron Fireplace Tools', 'Fireplace', 1, 'Set of 3', 'Blacksmith'),
('Leather-Crafted Wallet', 'Accessories', 1, 'Hand-Tooled', 'Leatherworker'),
('Hand-Embroidered Tablecloth', 'Home Decor', 1, 'Round', 'Embroidery Artist'),
('Recycled Glass Bowls', 'Home Decor', 4, 'Various Sizes', 'Glass Recyclers'),
('Macrame Dream Catcher', 'Home Decor', 1, 'Large', 'Macrame Artist'),
('Hand-Carved Wooden Chess Pieces', 'Games', 1, 'Intricate', 'Wood Carver'),
('Woolen Knitted Gloves', 'Accessories', 3, 'Winter', 'Knitting Workshop'),
('Hand-Painted Ceramic Wall Plaques', 'Home Decor', 3, 'Decorative', 'Tile Maker'),
('Rattan Basket', 'Home Decor', 2, 'Small', 'Rattan Weaver'),
('Handmade Soap', 'Personal Care', 10, 'Citrus', 'Soap Maker'),
('Hand-Woven Rug', 'Home Decor', 1, '4x6 ft', 'Rug Weaver'),
('Terracotta Plant Pots', 'Home Decor', 6, 'Large', 'Potter'),
('Hand-Carved Wooden Animal Figurines', 'Decorative Art', 5, 'Various', 'Wood Carver'),
('Bamboo Wind Chimes', 'Outdoors', 2, 'Hanging', 'Bamboo Craftsman'),
('Hand-Dyed Fabric', 'Textiles', 5, 'Tie-Dye', 'Natural Dyes Workshop'),
('Pressed Flower Coasters', 'Home Decor', 6, 'Set of 6', 'Flower Presser'),
('Hand-Painted Porcelain Dinnerware Set', 'Tableware', 1, '4 Place Settings', 'Ceramic Artist'),
('Recycled Tin Can Planters', 'Outdoors', 4, 'Small', 'Upcycled Crafts'),
('Hand-Knitted Socks', 'Accessories', 6, 'Wool', 'Knitting Circle'),
('Hand-Painted Wooden Puzzles', 'Games', 2, 'Jigsaw', 'Wood Toy Maker'),
('Dried Flower Wreath', 'Home Decor', 1, 'Front Door', 'Florist'),
('Hand-Forged Iron Garden Gates', 'Outdoors', 1, 'Small', 'Blacksmith'),
('Leather-Crafted Journal Cover', 'Stationery', 1, 'Hand-Tooled', 'Leatherworker'),
('Hand-Embroidered Pillowcases', 'Home Decor', 2, 'Silk', 'Embroidery Artist'),
('Recycled Glass Vases', 'Home Decor', 3, 'Tall', 'Glass Recyclers'),
('Macrame Wall Hanging', 'Home Decor', 1, 'Small', 'Macrame Artist'),
('Hand-Carved Wooden Bowls', 'Home Decor', 2, 'Small', 'Wood Carver'),
('Woolen Knitted Scarf', 'Accessories', 5, 'Short', 'Fair Trade Workshop'),
('Hand-Painted Ceramic Mug', 'Tableware', 6, 'Decorative', 'Pottery Studio'),
('Recycled Glass Jewelry', 'Accessories', 3, 'Necklaces', 'Urban Craft Co.'),
('Macrame Plant Hanger', 'Home Decor', 3, 'Medium', 'Etsy Seller'),
('Hand-Forged Iron Candlesticks', 'Home Decor', 2, 'Tall', 'Blacksmith Workshop'),
('Leather-Bound Notebook', 'Stationery', 3, 'Small', 'Leather Artisan'),
('Hand-Embroidered Cushion Covers', 'Home Decor', 4, '18x18"', 'Village Cooperative'),
('Woven Basket', 'Home Decor', 1, 'Medium', 'Indigenous Community'),
('Hand-Turned Wooden Pencils', 'Stationery', 10, 'Assorted', 'Woodworker'),
('Copper Teapot', 'Kitchen', 1, '1L', 'Metal Craftsman'),
('Hand-Painted Silk Scarf', 'Accessories', 2, 'Long', 'Silk Painter'),
('Rattan Furniture Set', 'Outdoors', 1, '1 Chair & Table', 'Rattan Weavers'),
('Handmade Soap', 'Personal Care', 10, 'Citrus', 'Soap Maker'),
('Hand-Woven Rug', 'Home Decor', 1, '6x9 ft', 'Rug Weaver');

select distinct supplier from product

Insert into product (product_name, category, quantity, size, supplier, approved_status ) values
('Handwoven Cotton Scarf', 'Textile', 50, '70x180 cm', 'Artisan Village', 'Approved'),
('Carved Wooden Bowl', 'Woodworking', 20, '15 cm diameter', 'Woodcrafters Inc.',   'Pending'   ),
('Beaded Necklace', 'Jewelry', 100, 'Adjustable', 'Beads & Beyond',   'Rejected'   ),
('Hand-Painted Ceramic Vase', 'Pottery', 30, '20 cm tall', 'Clay Creations',   'Approved'   ),
('Macrame Wall Hanging', 'Textile', 15, '60x90 cm', 'Knotty Creations',   'Pending'   ),
('Leather-Embossed Keyring', 'Leatherwork', 50, '5x8 cm', 'Leatherworks Co.',   'Approved'   ),
('Hand-Painted Wooden Toy Car', 'Woodworking', 25, '15x10 cm', 'Wooden Wonders',   'Pending'   ),
('Crochet Baby Blanket', 'Textile', 10, '75x100 cm', 'Cozy Knits',   'Approved'   ),
('Glass Blown Bird', 'Glassblowing', 12, '10 cm tall', 'Glassworks Studio',   'Rejected'   ),
('Hand-Woven Basket', 'Basketry', 20, '25x30 cm', 'Basket Weavers',   'Approved'   ),
('Recycled Tire Planter', 'Upcycled', 15, '40 cm diameter', 'Green Creations',   'Pending'   ),
('Hand-Embroidered Cushion Cover', 'Textile', 30, '40x40 cm', 'Embroidery Emporium',   'Approved'   ),
('Wooden Chess Set', 'Woodworking', 5, '30x30 cm', 'Woodcrafters Inc.',   'Pending'   ),
('Hand-Painted Ceramic Mug', 'Pottery', 50, '10 oz', 'Clay Creations',   'Approved'   ),
('Macrame Plant Hanger', 'Textile', 20, '60 cm long', 'Knotty Creations',   'Rejected'   ),
('Leather-Tooled Belt', 'Leatherwork', 15, '100 cm long', 'Leatherworks Co.',   'Approved'   ),
('Hand-Carved Wooden Spoon', 'Woodworking', 50, '25 cm long', 'Wooden Wonders',   'Pending'   ),
('Crochet Doily', 'Textile', 25, '20 cm diameter', 'Cozy Knits',   'Approved'   ),
('Glass Blown Vase', 'Glassblowing', 10, '25 cm tall', 'Glassworks Studio',   'Pending'   ),
('Hand-Woven Rug', 'Textile', 5, '150x200 cm', 'Artisan Village',   'Approved'   ),
('Recycled Bottle Candle Holder', 'Upcycled', 20, '10 cm tall', 'Green Creations',   'Rejected'   ),
('Hand-Embroidered Wall Art', 'Textile', 10, '40x50 cm', 'Embroidery Emporium',   'Approved'   ),
('Wooden Jewelry Box', 'Woodworking', 15, '20x15x10 cm', 'Woodcrafters Inc.',   'Pending'   ),
('Hand-Painted Ceramic Plate', 'Pottery', 30, '20 cm diameter', 'Clay Creations',   'Approved'   ),
('Macrame Dream Catcher', 'Textile', 15, '30 cm diameter', 'Knotty Creations',   'Rejected'   ),
('Leather-Embossed Journal Cover', 'Leatherwork', 25, '20x15 cm', 'Leatherworks Co.',   'Approved'   ),
('Hand-Carved Wooden Animal Figurine', 'Woodworking', 20, '10 cm tall', 'Wooden Wonders',   'Pending'   ),
('Crochet Scarf', 'Textile', 15, '180 cm long', 'Cozy Knits',   'Approved'   ),
('Glass Blown Pendant', 'Glassblowing', 12, '3 cm diameter', 'Glassworks Studio',   'Pending'   ),
('Hand-Woven Bag', 'Textile', 30, '30x40 cm', 'Artisan Village',   'Approved'   ),
('Recycled Tin Can Planter', 'Upcycled', 25, '15 cm tall', 'Green Creations',   'Rejected'   ),
('Hand-Embroidered Pillowcase', 'Textile', 40, '50x70 cm', 'Embroidery Emporium',   'Approved'   ),
('Wooden Cutting Board', 'Woodworking', 20, '30x20 cm', 'Woodcrafters Inc.',   'Pending'   ),
('Hand-Painted Ceramic Bowl', 'Pottery', 35, '15 cm diameter', 'Clay Creations',   'Approved'   ),
('Macrame Keychain', 'Textile', 50, '10 cm long', 'Knotty Creations',   'Rejected'   ),
('Leather-Tooled Bookmark', 'Leatherwork', 30, '15x5 cm', 'Leatherworks Co.',   'Approved'   ),
('Hand-Carved Wooden Chess Piece', 'Woodworking', 100, '5 cm tall', 'Wooden Wonders',   'Pending'   ),
('Crochet Coasters', 'Textile', 20, '10 cm diameter', 'Cozy Knits',   'Approved'   ),
('Glass Blown Ornament', 'Glassblowing', 25, '5 cm diameter', 'Glassworks Studio',   'Pending'   ),
('Hand-Woven Table Runner', 'Textile', 15, '40x120 cm', 'Artisan Village',   'Approved'   ),
('Recycled Plastic Bottle Flower Vase', 'Upcycled', 30, '20 cm tall', 'Green Creations',   'Rejected'   ),
('Hand-Embroidered Tablecloth', 'Textile', 5, '150x250 cm', 'Embroidery Emporium',   'Approved'   ),
('Wooden Photo Frame', 'Woodworking', 30, '10x15 cm', 'Woodcrafters Inc.',   'Pending'   ),
('Hand-Painted Ceramic Mug', 'Pottery', 50, '12 oz', 'Clay Creations',   'Approved'   ),
('Macrame Wall Hanging', 'Textile', 20, '40x60 cm', 'Knotty Creations',   'Rejected'   ),
('Leather-Embossed Phone Case', 'Leatherwork', 40,   'Fits iPhone 12'   , 'Leatherworks Co.',   'Approved'   ),
('Hand-Carved Wooden Pen', 'Woodworking', 50, '15 cm long', 'Wooden Wonders',   'Pending'   ),
('Crochet Baby Booties', 'Textile', 25,   'Newborn size'   , 'Cozy Knits',   'Approved'   ),
('Glass Blown Paperweight', 'Glassblowing', 15, '5 cm diameter', 'Glassworks Studio',   'Pending'   ),
('Hand-Woven Tote Bag', 'Textile', 40, '40x50 cm', 'Artisan Village',   'Approved'   ),
('Recycled Cardboard Box Organizer', 'Upcycled', 30, '20x30x15 cm', 'Green Creations',   'Rejected'   ),
('Hand-Embroidered Apron', 'Textile', 25,   'One size'   , 'Embroidery Emporium',   'Approved'   ),
('Wooden Puzzle', 'Woodworking', 10, '20x20 cm', 'Woodcrafters Inc.',   'Pending'   ),
('Hand-Painted Ceramic Teapot', 'Pottery', 15, '500 ml', 'Clay Creations',   'Approved'   ),
('Macrame Plant Hanger', 'Textile', 30, '40 cm long', 'Knotty Creations',   'Rejected'   ),
('Leather-Tooled Wallet', 'Leatherwork', 20, '10x15 cm', 'Leatherworks Co.',   'Approved' ),
('Hand-Carved Wooden Birdhouse', 'Woodworking', 15, '20x15 cm', 'Wooden Wonders',   'Pending'   ),
('Crochet Hat', 'Textile', 20,   'Adult size'   , 'Cozy Knits',   'Approved'   ),
('Glass Blown Bowl', 'Glassblowing', 10, '20 cm diameter', 'Glassworks Studio',   'Pending'   ),
('Hand-Woven Basket', 'Basketry', 25, '30x40 cm', 'Basket Weavers',   'Approved'   ),
('Recycled Plastic Bottle Flower Vase', 'Upcycled', 35, '25 cm tall', 'Green Creations',   'Rejected'   ),
('Hand-Embroidered Cushion Cover', 'Textile', 35, '45x45 cm', 'Embroidery Emporium',   'Approved'   ),
('Wooden Chess Set', 'Woodworking', 5, '35x35 cm', 'Woodcrafters Inc.',   'Pending'   ),
('Hand-Painted Ceramic Mug', 'Pottery', 55, '14 oz', 'Clay Creations',   'Approved'   );
                              
                              
select * from product;
select * from item_on_sale;


Create table supplier_account (
	supplierid int auto_increment,
    primary key(supplierid),
    name varchar(50),
    phone varchar(30),
    address varchar(50),
    email varchar(50), 
    password varchar(20)
);

create table supplier_bank_account(
	supplierid numeric(4),
    bank_name varchar(20), 
    bank_number numeric(20)
);

Create table rejected_item (
	product_id numeric (4), 
    reason varchar(100)
);

create table product (
	product_id int auto_increment, 
    primary key (product_id),
    product_name varchar(50), 
    category varchar(20),
    quantity numeric(3), 
    size varchar(20), 
    supplier varchar(40),
    approved_status varchar(10)
);

Create table orders (
	order_id numeric (4),
    primary key(order_id),
    order_datetime datetime,
    customer_id numeric(4), 
    customer_name varchar(30), 
    customer_address varchar(30), 
    customer_phone varchar(20), 
    order_status varchar(10),
    discount numeric(10)
);

Create table sales (
	order_id numeric (4),
    product_id numeric (4), 
    num numeric(3), 
    size varchar (3),
    unit_price numeric(5)
);




