
-- Create the table for blood groups
CREATE TABLE blood_groups (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(3) NOT NULL
);

-- Insert blood group data
INSERT INTO blood_groups (group_id, group_name) VALUES
    (1, 'A+'),
    (2, 'A-'),
    (3, 'B+'),
    (4, 'B-'),
    (5, 'AB+'),
    (6, 'AB-'),
    (7, 'O+'),
    (8, 'O-');

-- Create the table for donors
CREATE TABLE donors (
    donor_id INT PRIMARY KEY,
    donor_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    blood_group_id INT,
    contact_number VARCHAR(20),
    email VARCHAR(100),
    registration_date DATE,
    last_donation_date DATE,
    FOREIGN KEY (blood_group_id) REFERENCES blood_groups (group_id)
);

-- Create the table for recipients
CREATE TABLE recipients (
    recipient_id INT PRIMARY KEY,
    recipient_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    blood_group_id INT,
    contact_number VARCHAR(20),
    email VARCHAR(100),
    medical_history TEXT,
    FOREIGN KEY (blood_group_id) REFERENCES blood_groups (group_id)
);

-- Create the table for blood donations
CREATE TABLE blood_donations (
    donation_id INT PRIMARY KEY,
    donor_id INT,
    recipient_id INT,
    donation_date DATE,
    FOREIGN KEY (donor_id) REFERENCES donors (donor_id),
    FOREIGN KEY (recipient_id) REFERENCES recipients (recipient_id)
);

-- Create the table for donation centers
CREATE TABLE donation_centers (
    center_id INT PRIMARY KEY,
    center_name VARCHAR(200) NOT NULL,
    location VARCHAR(200) NOT NULL,
    contact_number VARCHAR(20),
    email VARCHAR(100)
);

-- Create the table for donor eligibility
CREATE TABLE donor_eligibility (
    eligibility_id INT PRIMARY KEY,
    donor_id INT,
    center_id INT,
    eligibility_status BOOLEAN,
    eligibility_date DATE,
    FOREIGN KEY (donor_id) REFERENCES donors (donor_id),
    FOREIGN KEY (center_id) REFERENCES donation_centers (center_id)
);

-- Create the table for donation appointments
CREATE TABLE donation_appointments (
    appointment_id INT PRIMARY KEY,
    donor_id INT,
    center_id INT,
    appointment_date DATE,
    appointment_time TIME,
    FOREIGN KEY (donor_id) REFERENCES donors (donor_id),
    FOREIGN KEY (center_id) REFERENCES donation_centers (center_id)
);
