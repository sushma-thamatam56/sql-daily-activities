USE cdg_hyd_jfs_058; 

-- USECASE 2 :Product Inventory

CREATE TABLE products(
             product_id INT AUTO_INCREMENT,
             sku VARCHAR(20) NOT NULL,
             product_name VARCHAR(150) NOT NULL,
             category VARCHAR(80) NOT NULL,
             brand VARCHAR(80),
             unit_price DECIMAL(12,2) NOT NULL,
             quantity_in_stock INT UNSIGNED NOT NULL DEFAULT 0,
             reorder_level INT UNSIGNED NOT NULL DEFAULT 5,
             manufacture_date DATE,
             expiry_date DATE,
             product_status VARCHAR(15) NOT NULL DEFAULT 'ACTIVE',
             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
             updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        ON UPDATE CURRENT_TIMESTAMP,
             CONSTRAINT `uq_sku` UNIQUE (sku),
             CONSTRAINT `pk_product_id` PRIMARY KEY (product_id),
             CONSTRAINT `chk_unit_price` CHECK (unit_price > 0),
             CONSTRAINT `chk_expiry_date` CHECK (
					    manufacture_date IS NULL
                        OR expiry_date IS NULL
                        OR expiry_date >= manufacture_date),
			CONSTRAINT `chk_product_status`
					   CHECK (product_status IN('ACTIVE','OUT_OF_STOCK',
                               'DISCONTINUED'))
);


-- Use Case 3: Customer Profile

CREATE TABLE customers(
			customer_id INT AUTO_INCREMENT,
            customer_code VARCHAR(12) NOT NULL,
            first_name VARCHAR(50) NOT NULL,
            last_name VARCHAR(50) NOT NULL,
            email VARCHAR(120) NOT NULL,
            phone VARCHAR(15),
            date_of_birth DATE,
            city VARCHAR(80) NOT NULL,
            state VARCHAR(80) NOT NULL,
            postal_code VARCHAR(12) NOT NULL,
            customer_type VARCHAR(15) NOT NULL DEFAULT 'REGULAR',
            credit_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,
            is_active BOOLEAN NOT NULL DEFAULT TRUE,
            registered_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
            CONSTRAINT `pk_customer_id` PRIMARY KEY (customer_id),
            CONSTRAINT `uk_customer_code` UNIQUE (customer_code),
            CONSTRAINT `uk_email` UNIQUE (email),
            CONSTRAINT `uk_phone` UNIQUE (phone),
            CONSTRAINT `chk_credit_limit_must_be_greater_than_zero` 
					    CHECK (credit_limit >= 0),
			CONSTRAINT `chk_customer_type`
                        CHECK(customer_type IN( 'REGULAR', 'PREMIUM', 'CORPORATE'))
);


-- Use Case 4: Book Catalogue

CREATE TABLE books(
	   book_id INT NOT NULL AUTO_INCREMENT,
       isbn CHAR(13)NOT NULL,
       title VARCHAR(200) NOT NULL ,
       author_name VARCHAR(120) NOT NULL,
       genre VARCHAR(60) NOT NULL,
       publisher VARCHAR(120) ,
       publication_year SMALLINT NOT NULL,
       page_count SMALLINT NOT NULL,
       book_format VARCHAR(20) NOT NULL,
       price DECIMAL(10,2)  NOT NULL,
       copies_available INT NOT NULL,
       language1 VARCHAR(40) NOT NULL DEFAULT 'English',
       added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
       CONSTRAINT `uk_isbn` UNIQUE (isbn),
       CONSTRAINT `pk_book_id` PRIMARY KEY(book_id),
       CONSTRAINT `chk_publication_year` CHECK(publication_year BETWEEN 1000 AND 2100),
       CONSTRAINT `chk_page_count` CHECK(page_count > 0),
       CONSTRAINT `chk_price_AND_copies_available` 
				   CHECK(price >= 0 AND copies_available >= 0),
	   CONSTRAINT `chk_book_format`
				   CHECK(book_format IN('HARDCOVER','PAPERBACK','EBOOK'))
);


-- Use Case 5: Patient Registration
CREATE TABLE patients(
	   patient_id INT NOT NULL AUTO_INCREMENT,
       patient_number VARCHAR(15) NOT NULL,
       first_name VARCHAR(50) NOT NULL,
       last_name VARCHAR(50) NOT NULL,
       date_of_birth DATE NOT NULL,
       biological_sex VARCHAR(20) NOT NULL,
       blood_group VARCHAR(20),
       phone VARCHAR(15) NOT NULL,
       email VARCHAR(20),
       emergency_contact_name VARCHAR(100) NOT NULL,
       emergency_contact_phone VARCHAR(15) NOT NULL,
       allergies TEXT,
       patient_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
       registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       CONSTRAINT `pk_patient_id` PRIMARY KEY (patient_id),
       CONSTRAINT `uk_patient_number` UNIQUE(patient_number),
       CONSTRAINT `chk_blood_group` 
                   CHECK (blood_group IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
	   CONSTRAINT `chk_biological_sex`
                  CHECK(biological_sex IN('FEMALE','MALE', 'INTERSEX','NOT_DISCLOSED')),
	   CONSTRAINT `chk_patient_status`
                  CHECK(patient_status IN( 'ACTIVE', 'INACTIVE','DECEASED'))
);


-- Use Case 6: Bank Account Summary
CREATE TABLE bank_accounts(
    account_id INT NOT NULL AUTO_INCREMENT,
    account_number CHAR(12) NOT NULL,
    account_holder_name VARCHAR(120) NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    currency_code CHAR(3) NOT NULL DEFAULT 'INR',
    branch_name VARCHAR(100) NOT NULL,
    opened_date DATE NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    overdraft_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    account_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `pk_account_id`
        PRIMARY KEY (account_id),
    CONSTRAINT `uk_account_number`
        UNIQUE (account_number),
    CONSTRAINT `chk_account_type`
        CHECK(account_type IN('SAVINGS','CURRENT','FIXED_DEPOSIT')),
    CONSTRAINT `chk_balance`
        CHECK(balance >= 0),
    CONSTRAINT `chk_overdraft_limit`
        CHECK(overdraft_limit >= 0),
    CONSTRAINT `chk_interest_rate`
        CHECK(interest_rate BETWEEN 0.00 AND 100.00),
    CONSTRAINT `chk_account_status`
        CHECK(account_status IN('ACTIVE','FROZEN','DORMANT','CLOSED' ))
);

        
--  Use Case 7: Vehicle Registry
CREATE TABLE vehicles(
	vehicle_id INT NOT NULL AUTO_INCREMENT,
    registration_number VARCHAR(20) NOT NULL,
    owner_name VARCHAR(120) NOT NULL,
    manufacturer VARCHAR(120) NOT NULL,
    model VARCHAR(120) NOT NULL,
    vehicle_type VARCHAR(120) NOT NULL,
    fuel_type VARCHAR(120)  NOT NULL,
    manufacture_year YEAR NOT NULL,
    purchase_date DATE,
    color VARCHAR(40) NOT NULL,
    odometer_km INT NOT NULL DEFAULT 0,
    insurance_expiry DATE,
    vehicle_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `pk_vehicle_id` PRIMARY KEY (vehicle_id),
    CONSTRAINT `uk_registration_number` UNIQUE(registration_number),
    CONSTRAINT `chk_odometer_km` CHECK(odometer_km >0),
    CONSTRAINT `chk_vehicle_type` 
         CHECK(vehicle_type IN('CAR', 'MOTORCYCLE', 'TRUCK', 'VAN', 'BUS')),
    CONSTRAINT chk_fuel_type
        CHECK (fuel_type IN ('PETROL', 'DIESEL', 'ELECTRIC', 'HYBRID', 'CNG')),
	CONSTRAINT chk_vehicle_status
        CHECK (vehicle_status IN ('ACTIVE', 'IN_SERVICE', 'SOLD', 'SCRAPPED'))
);

-- Use Case 8: Hotel Room Inventory
CREATE TABLE hotel_rooms(
       room_id INT NOT NULL AUTO_INCREMENT,
       room_number VARCHAR(10) NOT NULL,
       room_type VARCHAR(10) NOT NULL,
       floor_number SMALLINT NOT NULL,
       bed_count TINYINT NOT NULL,
       max_occupancy TINYINT NOT NULL,
       price_per_night DECIMAL(10,2) NOT NULL,
       availability_status VARCHAR(20)  NOT NULL DEFAULT 'AVAILABLE',
       has_air_conditioning BOOLEAN NOT NULL DEFAULT TRUE ,
       smoking_allowed BOOLEAN  NOT NULL DEFAULT FALSE,
       notes VARCHAR(255),
       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
       ON UPDATE CURRENT_TIMESTAMP,
       CONSTRAINT `pk_room_id` PRIMARY KEY(room_id),
       CONSTRAINT `uk_room_number` UNIQUE (room_number),
       CONSTRAINT `chk_room_type` 
            CHECK(room_type IN('SINGLE', 'DOUBLE', 'DELUXE', 'SUITE')),
	   CONSTRAINT `chk_availability_status` 
             CHECK(availability_status IN('AVAILABLE', 'RESERVED', 'OCCUPIED','MAINTENANCE')),
       CONSTRAINT `chk_price_per_night` 
			CHECK (price_per_night > 0),
	   CONSTRAINT `chk_bed_count`
            CHECK(bed_count >= 1),
	   CONSTRAINT `chk_max_occupancy`
            CHECK(max_occupancy >= 1)
);

-- Use Case 9: Movie Catalogue
 
CREATE TABLE movies(
       movie_id INT NOT NULL AUTO_INCREMENT,
       movie_code VARCHAR(12) NOT NULL,
       title VARCHAR(200) NOT NULL,
       genre VARCHAR(60) NOT NULL,
       original_language VARCHAR(40)NOT NULL,
       release_date DATE,
       duration_minutes SMALLINT NOT NULL,
       director_name VARCHAR(120) NOT NULL,
       age_certificate VARCHAR(20) NOT NULL DEFAULT 'UNRATED',
       audience_rating DECIMAL(3,1),
       production_budget DECIMAL(15,2),
       catalog_status VARCHAR(20) NOT NULL DEFAULT 'UPCOMING',
       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
       updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
       ON UPDATE CURRENT_TIMESTAMP,
       CONSTRAINT `uk_movie_code` UNIQUE(movie_code),
       CONSTRAINT `pk_movie_id` PRIMARY KEY(movie_id),
       CONSTRAINT `chk_duration_minutes` CHECK(duration_minutes>0),
       CONSTRAINT `chk_audience_rating` CHECK(audience_rating BETWEEN 0.0 AND 10.0),
       CONSTRAINT `chk_production_budget` CHECK(production_budget>0),
       CONSTRAINT `chk_age_certificate` 
       CHECK(age_certificate IN('ALL_AGES', 'PARENTAL_GUIDANCE', 'ADULT','UNRATED')),
       CONSTRAINT `chk_catalog_status` 
       CHECK(catalog_status IN('UPCOMING',' RELEASED','ARCHIVED)'))
       
       
);

-- Use Case 10: Customer Support Ticket
 
 CREATE TABLE support_tickets(
    ticket_id INT NOT NULL AUTO_INCREMENT,
    ticket_number VARCHAR(20) NOT NULL,
    requester_name VARCHAR(120) NOT NULL,
    requester_email VARCHAR(120) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(20) NOT NULL,
    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
    ticket_status VARCHAR(20) NOT NULL DEFAULT 'OPEN',
    assigned_agent VARCHAR(120),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,
    last_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `pk_ticket_id` PRIMARY KEY(ticket_id),
    CONSTRAINT `uk_ticket_number` UNIQUE(ticket_number),
    CONSTRAINT `chk_category`
        CHECK(category IN('BILLING','TECHNICAL','ACCOUNT','GENERAL')),
    CONSTRAINT `chk_priority`
        CHECK(priority IN('LOW','MEDIUM','HIGH','CRITICAL')),
    CONSTRAINT `chk_ticket_status`
        CHECK(ticket_status IN('OPEN','IN_PROGRESS','RESOLVED','CLOSED')),
    CONSTRAINT `chk_resolved_at`
        CHECK(resolved_at IS NULL OR resolved_at >= created_at)
);

        
        
        
        
        
        
        

        
        
 
