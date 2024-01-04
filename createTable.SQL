-- Create the SHOP table
CREATE TABLE SHOP (
    sId INT PRIMARY KEY,
    Sname VARCHAR(255),
    Street VARCHAR(255),
    City VARCHAR(255),
    StateAb CHAR(2),
    ZipCode VARCHAR(10),
    Sdate DATE,
    Telno VARCHAR(15),
    URL VARCHAR(255)
);

-- Create the CUSTOMER table
CREATE TABLE CUSTOMER (
    cId INT PRIMARY KEY,
    Cname VARCHAR(255),
    Street VARCHAR(255),
    City VARCHAR(255),
    StateAb CHAR(2),
    Zipcode VARCHAR(10)
);

-- Create the DEALER table
CREATE TABLE DEALER (
    dId INT PRIMARY KEY,
    Dname VARCHAR(255),
    Street VARCHAR(255),
    City VARCHAR(255),
    StateAb CHAR(2),
    Zipcode VARCHAR(10)
);

-- Create the DEALER_SHOP table
CREATE TABLE DEALER_SHOP (
    dId INT,
    sId INT,
    PRIMARY KEY (dId, sId),
    FOREIGN KEY (dId) REFERENCES DEALER(dId),
    FOREIGN KEY (sId) REFERENCES SHOP(sId)
);

-- Create the CONTRACT table
CREATE TABLE CONTRACT (
    dId INT,
    ctId INT,
    Sdate DATE,
    Ctime TIME,
    Cname VARCHAR(255),
    PRIMARY KEY (dId,ctId),
    FOREIGN KEY (dId) REFERENCES DEALER(dId)
);

-- Create the ITEM table
CREATE TABLE ITEM (
    iId INT PRIMARY KEY,
    Iname VARCHAR(255),
    Sprice DECIMAL(10, 2)
);

-- Create the DEALER_ITEM table
CREATE TABLE DEALER_ITEM (
    dId INT,
    iId INT,
    dprice DECIMAL(10, 2),
    PRIMARY KEY (dId, iId),
    FOREIGN KEY (dId) REFERENCES DEALER(dId),
    FOREIGN KEY (iId) REFERENCES ITEM(iId)
);

-- Create the OLDPRICE table
CREATE TABLE OLDPRICE (
    iId INT,
    Sprice DECIMAL(10, 2),
    Sdate DATE,
    Edate DATE,
    PRIMARY KEY (iId, Sprice),
    FOREIGN KEY (iId) REFERENCES ITEM(iId)
);

-- Create the ORDER table
CREATE TABLE ORDERS (
    oId INT PRIMARY KEY,
    sId INT,
    cId INT,
    Odate DATE,
    Ddate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (sId) REFERENCES SHOP(sId),
    FOREIGN KEY (cId) REFERENCES CUSTOMER(cId)
);

-- Create the ORDER_ITEM table
CREATE TABLE ORDER_ITEM (
    oId INT,
    sId INT,
    iId INT,
    Icount INT,
    PRIMARY KEY (oId, sId, iId),
    FOREIGN KEY (oId) REFERENCES ORDERS(oId),
    FOREIGN KEY (sId) REFERENCES SHOP(sId),
    FOREIGN KEY (iId) REFERENCES ITEM(iId)
);

-- Create the SHOP_ITEM table
CREATE TABLE SHOP_ITEM (
    sId INT,
    iId INT,
    Scount INT,
    PRIMARY KEY (sId, iId),
    FOREIGN KEY (sId) REFERENCES SHOP(sId),
    FOREIGN KEY (iId) REFERENCES ITEM(iId)
);


-- Create the SHOP_CUSTOMER table
CREATE TABLE SHOP_CUSTOMER (
    sId INT,
    cId INT,
    PRIMARY KEY (sId, cId),
    FOREIGN KEY (sId) REFERENCES SHOP(sId),
    FOREIGN KEY (cId) REFERENCES CUSTOMER(cId)
);

-- Create the EMPLOYEE table
CREATE TABLE EMPLOYEE (
    sId INT,
    SSN CHAR(9) PRIMARY KEY,
    Ename VARCHAR(255),
    Street VARCHAR(255),
    City VARCHAR(255),
    StateAb CHAR(2),
    Zipcode VARCHAR(10),
    Bdate DATE,
    Sdate DATE,
    Edate DATE,
    Etype VARCHAR(50),
    Level INT,
    Asalary DECIMAL(10, 2),
    Agency VARCHAR(255),
    Hsalary DECIMAL(10, 2),
    Institute VARCHAR(255),
    Itype VARCHAR(50),
     FOREIGN KEY (sId) REFERENCES SHOP(sId)
);
