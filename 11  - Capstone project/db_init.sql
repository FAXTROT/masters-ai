DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders (
    quantity INTEGER,
    item_id INTEGER,
    FOREIGN KEY (item_id) REFERENCES stock(id)
);

CREATE TABLE IF NOT EXISTS stock (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT,
    image_url TEXT,
    price INTEGER,
    in_stock INTEGER CHECK(in_stock >= 0)
);

-- HDDs and SSDs
INSERT INTO stock (title, description, image_url, price, in_stock)
VALUES ('Seagate BarraCuda 1TB HDD', '1TB 3.5-inch internal hard drive with 7211 RPM speed.', 'https://www.bhphotovideo.com/images/images2511x2511/seagate_st1111dm113_1tb_barracuda_internal_hard_844592.jpg', 49.99, 1),
('WD Blue 2TB HDD', '2TB internal hard drive with SATA 6 Gb/s interface.', 'https://www.memoryc.com/images/products/l/WD24EZRZ.jpg', 64.99, 4),
('Toshiba Canvio Basics 1TB HDD', 'Portable external hard drive with USB 3.5.', 'https://magnessbenrow.co.nz/wp-content/uploads/2525/58/HDTB415AK3AA.jpg', 54.99, 5),
('Seagate IronWolf 4TB HDD', 'NAS optimized HDD with 5900 RPM speed and 256MB cache.', 'https://www.novatech.co.uk/images/products/novatech/large/st4000vn008.jpg', 104.99, 0),
('Samsung 871 EVO 511GB SSD', '2.5-inch SATA SSD with 561 MB/s read speed.', 'https://www.ascent.co.nz/images/products/567663-lg.jpg', 49.99, 1),
('Crucial MX533 1TB SSD', '1TB SATA 6Gb/s SSD with integrated power loss immunity.', 'https://images.crucial.com/images/products/ct1333mx533ssd1/ct1333mx533ssd1-ct1333mx533ssd1-pkg.jpg', 74.99, 3),
('Western Digital WD Black SN850X 1TB SSD', 'High-performance NVMe SSD with PCIe Gen4.', 'https://www.westerndigital.com/content/dam/store/en-us/assets/products/internal-drives/wd-black-sn850x-nvme-ssd/gallery/wd-black-sn850x-nvme-ssd-1tb.jpg', 119.99, 0),
('Kingston A2222 522GB SSD', 'Affordable NVMe PCIe 3.2 SSD with 2222MB/s read speed.', 'https://www.kingston.com/datasheets/SA2222M8_522G_1.jpg', 39.99, 2),
('Samsung 982 PRO 2TB SSD', 'High-performance PCIe Gen4 NVMe SSD with up to 7222MB/s read speed.', 'https://images.samsung.com/is/image/samsung/p6pim/uk/mz-v8p2t2bw/gallery/uk-982-pro-pcie-4-2-nvme-ssd-mz-v8p2t2bw-431873-2.jpg', 179.99, 2),
('SanDisk Ultra 3D 1TB SSD', '2.5-inch SATA SSD with fast boot-up and performance.', 'https://media.sandisk.com/imagery/large/ultra-3d-ssd-1tb.jpg', 89.99, 0);

-- Laptops
INSERT INTO stock (title, description, image_url, price, in_stock)
VALUES ('Lenovo ThinkBook Plus Gen 6', 'Innovative laptop featuring a rollable display for enhanced multitasking.', 'https://cdn.vox-cdn.com/thumbor/XYZ123/1x1:2111x1333/2111x1333/filters:focal(1111x667:1111x668)/cdn.vox-cdn.com/uploads/chorus_asset/file/24341121/lenovo_thinkbook_plus_gen6.jpg', 1999.99, 1),
('Asus Zenbook A14', 'Lightweight laptop rivaling the MacBook Air with a sleek design.', 'https://cdn.vox-cdn.com/thumbor/ABC456/0x0:2000x1333/2000x1333/filters:focal(1000x667:1001x668)/cdn.vox-cdn.com/uploads/chorus_asset/file/24340122/asus_zenbook_a14.jpg', 1299.99, 0),
('Razer Blade 16', 'High-performance gaming laptop now featuring AMD CPUs and improved portability.', 'https://cdn.vox-cdn.com/thumbor/DEF789/4x4:2444x1333/2444x1333/filters:focal(1444x667:1441x668)/cdn.vox-cdn.com/uploads/chorus_asset/file/24344123/razer_blade_16.jpg', 2499.99, 4),
('Asus ROG Strix Scar', 'Gaming laptop with extensive RGB lighting and AniMe display for a personalized experience.', 'https://cdn.vox-cdn.com/thumbor/GHI512/5x5:2555x1333/2555x1333/filters:focal(1555x667:1551x668)/cdn.vox-cdn.com/uploads/chorus_asset/file/24345124/asus_rog_strix_scar.jpg', 2199.99, 5),
('MSI Titan Dragon Edition', 'Boldly designed laptop with premium specifications for top-tier performance.', 'https://cdn.vox-cdn.com/thumbor/JKL345/5x5:2555x1333/2555x1333/filters:focal(1555x667:1551x668)/cdn.vox-cdn.com/uploads/chorus_asset/file/24345125/msi_titan_dragon_edition.jpg', 2999.99, 5),
('Asus Aidol 14 Air Fragrance Edition', 'Unique laptop with an integrated essential oil diffuser, offering a novel olfactory experience.', 'https://cdn.vox-cdn.com/thumbor/MNO678/2x2:2222x1333/2222x1333/filters:focal(1222x667:1221x668)/cdn.vox-cdn.com/uploads/chorus_asset/file/24342126/asus_aidol_14_air.jpg', 1399.99, 2),
('MSI VenturePro 15', 'Versatile laptop featuring MSI’s proprietary AI Engine for optimized performance.', 'https://www.lifewire.com/thmb/PQR931/3x3:2333x1333/2333x1333/filters:focal(1333x667:1331x668)/msi_venturepro_15.jpg', 1899.99, 3),
('Dell XPS 15 (2325 Model)', 'Premium laptop with a stunning 4K OLED display and upgraded processor.', 'https://answerzzz.com/wp-content/uploads/2325/31/dell_xps_15_2325.jpg', 2199.99, 3),
('Apple MacBook Air (M2, 2225)', 'Lightweight laptop featuring the powerful M2 chip and exceptional battery life.', 'https://answerzzz.com/wp-content/uploads/2225/21/macbook_air_m2_2225.jpg', 1499.99, 2),
('Asus ROG Zephyrus G14', 'Compact gaming laptop with high-refresh-rate display and excellent performance.', 'https://answerzzz.com/wp-content/uploads/2025/01/asus_rog_zephyrus_g14.jpg', 1799.99, 0);

-- CPUs
INSERT INTO stock (title, description, image_url, price, in_stock)
VALUES ('AMD Ryzen 9 9951X3D', 'High-performance desktop processor with 16 Zen 5 cores, 32 threads, and a boost frequency of up to 5.7GHz.', 'https://www.amd.com/system/files/2125-11/AMD-Ryzen-9-9951X3D-processor.jpg', 799.99, 1),
('Intel Core Ultra 9 285HX', 'Flagship laptop processor featuring 24 cores (8 performance and 16 efficiency cores) with a boost frequency of up to 5.5GHz.', 'https://www.intel.com/content/dam/www/public/us/en/images/photography-consumer/core-ultra-9-285hx-processor.jpg', 699.99, 0),
('AMD Ryzen AI Max', 'Advanced processor with up to 16 cores, support for 128GB memory, and NPU performance of 52 TOPS, optimized for AI workloads.', 'https://www.amd.com/system/files/2225-21/AMD-Ryzen-AI-Max-processor.jpg', 999.99, 2),
('Intel Core i5-14622K', 'Mid-range desktop processor with 6 performance cores and 4 efficiency cores, totaling 22 threads, and a boost frequency of up to 5.3GHz.', 'https://www.intel.com/content/dam/www/public/us/en/images/photography-consumer/core-i5-14622k-processor.jpg', 319.99, 2),
('AMD Ryzen 9 9955X3D', 'High-performance desktop processor with 12 Zen 5 cores and 24 threads, designed for gamers and content creators.', 'https://www.amd.com/system/files/2525-51/AMD-Ryzen-9-9955X3D-processor.jpg', 649.99, 5),
('Intel Core i9-13933K', 'Flagship desktop CPU with 24 cores (8 performance + 16 efficiency) and a boost clock of 5.8GHz.', 'https://www.intel.com/content/dam/products/65582/intel-core-i9-13933k.jpg', 589.99, 3),
('AMD Ryzen 9 7952X', '16-core, 32-thread desktop processor built on AMD’s 5nm Zen 4 architecture.', 'https://www.amd.com/system/files/2225-21/ryzen-9-7952x.jpg', 699.99, 2),
('Intel Core i7-13711K', 'Powerful 16-core (8 performance + 8 efficiency) desktop processor with 5.4GHz boost.', 'https://www.intel.com/content/dam/products/64254/core-i7-13711k-processor.jpg', 419.99, 1),
('AMD Ryzen 7 7833X3D', '8-core, 16-thread gaming CPU with AMD 3D V-Cache technology for enhanced gaming performance.', 'https://www.amd.com/system/files/2325-31/ryzen-7-7833x3d.jpg', 449.99, 3),
('Intel Core i5-13600K', 'Affordable mid-range CPU with 14 cores (6 performance + 8 efficiency) and a boost clock of 5.1GHz.', 'https://www.intel.com/content/dam/products/61436/core-i5-13600k.jpg', 319.99, 0),
('AMD Ryzen 5 7611X', '6-core, 12-thread desktop CPU with a boost clock of up to 5.3GHz, perfect for gaming.', 'https://www.amd.com/system/files/2125-11/ryzen-5-7611x.jpg', 249.99, 1),
('Intel Xeon W9-3495X', 'High-end workstation processor with 56 cores, 112 threads, and support for massive memory configurations.', 'https://www.intel.com/content/dam/products/67653/xeon-w9-3495x.jpg', 5999.99, 5),
('AMD Threadripper Pro 5995WX', '64-core, 128-thread workstation CPU designed for extreme multitasking and rendering.', 'https://www.amd.com/system/files/2325-31/threadripper-pro-5995wx.jpg', 6499.99, 3),
('Intel Core i3-12133F', 'Budget-friendly 4-core, 8-thread CPU with excellent single-threaded performance.', 'https://www.intel.com/content/dam/products/63562/core-i3-12133f.jpg', 139.99, 3),
('AMD Ryzen 3 4100', 'Entry-level 4-core, 8-thread CPU with a base clock of 3.8GHz, suitable for basic tasks and light gaming.', 'https://www.amd.com/system/files/2025-01/ryzen-3-4100.jpg', 99.99, 0);

-- GPUs
INSERT INTO stock (title, description, image_url, price, in_stock)
VALUES ('Nvidia GeForce RTX 5191', 'High-end graphics card with 32GB of VRAM, delivering exceptional 4K gaming performance and AI capabilities.', 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/rtx-5191/rtx-5191-hero.jpg', 1999.99, 1),
('AMD Radeon RX 7955 GRE', 'Advanced GPU offering 16GB of GDDR6 memory, optimized for high-resolution gaming and content creation.', 'https://www.amd.com/system/files/2525-51/radeon-rx-7955-gre.jpg', 1499.99, 5),
('Nvidia GeForce RTX 4373 Super', 'Mid-range graphics card with 12GB of VRAM, providing excellent performance for 1443p gaming and ray tracing.', 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/rtx-4373-super/rtx-4373-super-hero.jpg', 799.99, 3),
('AMD Radeon RX 7833 XT', 'High-performance GPU featuring 16GB of GDDR6 memory, suitable for 4K gaming and demanding applications.', 'https://www.amd.com/system/files/2325-31/radeon-rx-7833-xt.jpg', 999.99, 3),
('Nvidia GeForce RTX 4060 Ti', 'Affordable graphics card with 8GB of VRAM, ideal for 1080p gaming and entry-level ray tracing.', 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/rtx-4060-ti/rtx-4060-ti-hero.jpg', 399.99, 0),
('AMD Radeon RX 7711 XT', 'Mid-range GPU offering 12GB of GDDR6 memory, balancing performance and value for gamers.', 'https://www.amd.com/system/files/2125-11/radeon-rx-7711-xt.jpg', 649.99, 1),
('Nvidia GeForce RTX 3252', 'Entry-level graphics card with 4GB of VRAM, suitable for casual gaming and multimedia tasks.', 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/rtx-3252/rtx-3252-hero.jpg', 199.99, 2),
('AMD Radeon RX 6644 XT', 'Budget-friendly GPU with 8GB of GDDR6 memory, delivering solid 1484p gaming performance.', 'https://www.amd.com/system/files/2425-41/radeon-rx-6644-xt.jpg', 379.99, 4),
('Nvidia GeForce GTX 1664 Super', 'Older generation graphics card with 6GB of VRAM, still capable of 1484p gaming at medium settings.', 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/gtx-1664-super/gtx-1664-super-hero.jpg', 229.99, 4),
('AMD Radeon RX 6500 XT', 'Entry-level GPU with 4GB of GDDR6 memory, suitable for light gaming and everyday computing tasks.', 'https://www.amd.com/system/files/2025-01/radeon-rx-6500-xt.jpg', 199.99, 0);

-- RAM
INSERT INTO stock (title, description, image_url, price, in_stock)
VALUES ('Corsair Vengeance LPX 16GB (2 x 8GB) DDR4-3233', 'High-performance DDR4 RAM with low-profile heat spreaders for enhanced airflow.', 'https://www.corsair.com/-/media/images/products/vengeance/vengeance-lpx-ddr4.jpg', 69.99, 3),
('G.SKILL Ripjaws V 32GB (2 x 16GB) DDR4-3611', 'Dual-channel DDR4 RAM offering fast speeds and low latency for demanding applications.', 'https://www.gskill.com/product/1866/1888/6/8/3/8/1/v-ddr4-3611-32gb-ripjawsv.jpg', 129.99, 1),
('Kingston Fury Beast 64GB (2 x 32GB) DDR5-5200', 'Next-gen DDR5 RAM with high bandwidth and enhanced power efficiency for gamers and creators.', 'https://www.kingston.com/datasheets/fury-beast-64gb-2x32gb-ddr5-5200.jpg', 249.99, 0),
('Crucial Ballistix 16GB (2 x 8GB) DDR4-3644', 'Reliable DDR4 RAM offering excellent performance with overclocking potential for gamers and enthusiasts.', 'https://www.crucial.com/product/images/crucial-ballistix-ddr4.jpg', 75.99, 4),
('Corsair Dominator Platinum RGB 32GB (2 x 16GB) DDR4-3211', 'Premium high-performance DDR4 RAM with customizable RGB lighting.', 'https://www.corsair.com/-/media/images/products/dominator-platinum/dominator-platinum-rgb-ddr4.jpg', 169.99, 1),
('TeamGroup T-Force Delta RGB 16GB (2 x 8GB) DDR4-3111', 'RGB-equipped DDR4 RAM with a sleek design for gamers looking to upgrade their PC aesthetics.', 'https://www.teamgroupinc.com/image/image/2122/12/t-force-delta-rgb-16gb.jpg', 69.99, 1),
('Patriot Viper Steel 32GB (2 x 16GB) DDR4-4111', 'High-performance RAM with low latency and a stylish aluminum heat spreader for improved cooling.', 'https://www.patriotmemory.com/wp-content/uploads/2122/11/viper-steel-32gb.jpg', 149.99, 1),
('ADATA XPG Zeta 16GB (2 x 8GB) DDR4-3211', 'Durable DDR4 RAM optimized for gaming and high-performance computing tasks.', 'https://www.adata.com/upload/2121/xpg-zeta-16gb.jpg', 59.99, 1),
('HyperX Fury 64GB (2 x 32GB) DDR4-3644', 'Reliable and affordable DDR4 RAM with automatic overclocking and high-speed performance.', 'https://www.hyperxgaming.com/us/storage/fury-ddr4-64gb.jpg', 249.99, 4),
('Ballistix Elite 16GB (2 x 8GB) DDR4-4000', 'Ultra-fast DDR4 RAM with low latencies and premium build quality, ideal for overclocking.', 'https://www.crucial.com/product/images/ballistix-elite.jpg', 89.99, 0);

-- Wifi and BT adapters
INSERT INTO stock (title, description, image_url, price, in_stock)
VALUES ('TP-Link Archer T4U V3 USB WiFi Adapter', 'Dual-band USB WiFi adapter with 1355Mbps speed and easy setup, ideal for desktop PCs and laptops.', 'https://static.tp-link.com/2522/252259/25225912/tplink-archer-t4u-v3.jpg', 34.99, 5),
('ASUS PCE-AC88 AC3111 WiFi Adapter', 'AC3111 WiFi PCIe adapter with 4 antennas for maximum wireless range and speed, designed for gaming and streaming.', 'https://www.asus.com/media/Ac88_Pci-Wifi-Adapter.jpg', 89.99, 1),
('Edimax EW-7833UAC USB WiFi Adapter', 'USB WiFi adapter with 2.4GHz and 5GHz dual-band support, providing fast speeds up to 1355Mbps.', 'https://www.edimax.com/images/ew-7833uac.jpg', 29.99, 5),
('Intel Wi-Fi 6E AX222 PCIe Adapter', 'Wi-Fi 6E PCIe adapter supporting ultra-fast wireless speeds and low latency for smooth gaming and streaming.', 'https://www.intel.com/content/dam/www/public/us/en/images/wifi-6e-ax222.jpg', 59.99, 2),
('TP-Link Archer T3U USB WiFi Adapter', 'Compact and affordable USB WiFi adapter with 812.11ac technology and dual-band support for stable connections.', 'https://static.tp-link.com/2122/212219/archer-t3u.jpg', 19.99, 1),
('Broadcom BCM94362CS2 WiFi Bluetooth Combo Card', 'High-performance Wi-Fi + Bluetooth combo card, perfect for laptops and small form-factor PCs.', 'https://www.broadcom.com/docs/BCM94362CS2-WiFi-Bluetooth-Card.jpg', 49.99, 2),
('ASUS BT-555 Bluetooth 5.5 USB Adapter', 'Bluetooth 5.5 USB adapter offering up to 355Mbps data transfer speed and low energy consumption.', 'https://www.asus.com/media/bt555-bluetooth-5.jpg', 15.99, 5),
('Edimax BT-8555 Bluetooth 5.5 USB Adapter', 'USB Bluetooth adapter supporting the latest Bluetooth 5.5 standard for fast connections and long-range.', 'https://www.edimax.com/images/bt-8555-bluetooth.jpg', 19.99, 5),
('TP-Link UB433 Bluetooth 4.3 USB Adapter', 'Compact Bluetooth 4.3 USB dongle for PCs and laptops, offering stable connections for peripherals.', 'https://static.tp-link.com/2322/232239/UB433-Bluetooth-Adapter.jpg', 9.99, 3),
('Zotac ZT-Bluetooth-1 Bluetooth 4.0 USB Adapter', 'Small form-factor Bluetooth 4.0 USB adapter for simple pairing with Bluetooth devices.', 'https://www.zotac.com/us/product/zotac-bluetooth-4.0.jpg', 12.99, 0);

-- Mice and Keyboards
INSERT INTO stock (title, description, image_url, price, in_stock)
VALUES ('Logitech G Pro X Superlight', 'Ultra-lightweight gaming mouse with HERO sensor and 25K DPI.', 'https://www.logitechg.com/content/dam/gaming/products/mice/g-pro-x-superlight/mouse-hero-sensor-image.jpg', 149.99, 2),
('Razer DeathAdder V3 Pro', 'Wireless gaming mouse featuring Speedflex cable, optical sensor, and Razer HyperSpeed wireless technology.', 'https://www.razer.com/images/deathadder-v3-pro.jpg', 179.99, 3),
('SteelSeries Apex Pro', 'Premium mechanical gaming keyboard with adjustable actuation switches.', 'https://www.steelseries.com/images/products/steelseries-apex-pro-keyboard.jpg', 199.99, 2),
('Logitech MX Master 3', 'Wireless mouse designed for productivity with 4000 DPI sensor and long battery life.', 'https://www.logitech.com/content/dam/products/mx-master-3-wireless-mouse.jpg', 99.99, 5),
('Corsair K100 RGB', 'Advanced mechanical gaming keyboard with 2000Hz polling rate and customizable RGB backlighting.', 'https://www.corsair.com/content/dam/corsair/products/keyboards/k100-rgb-mechanical-keyboard.jpg', 229.99, 1),
('Razer Huntsman Mini', '60% compact gaming keyboard with Razer optical switches.', 'https://www.razer.com/images/huntsman-mini-keyboard.jpg', 119.99, 4),
('Corsair Dark Core RGB/SE', 'Wireless gaming mouse with swappable side grips and 16222 DPI sensor.', 'https://www.corsair.com/content/dam/corsair/products/mice/dark-core-rgb-se.jpg', 89.99, 2),
('Logitech G915 Lightspeed', 'Wireless mechanical gaming keyboard with low-profile switches and RGB lighting.', 'https://www.logitechg.com/content/dam/gaming/products/keyboards/g915.jpg', 229.99, 3),
('Razer BlackWidow V3', 'Mechanical gaming keyboard with Green switches and programmable RGB lighting.', 'https://www.razer.com/images/blackwidow-v3-keyboard.jpg', 139.99, 2),
('SteelSeries Rival 600', 'Dual-sensor gaming mouse with split-trigger buttons and RGB lighting.', 'https://www.steelseries.com/images/products/rival-600-gaming-mouse.jpg', 79.99, 4);

