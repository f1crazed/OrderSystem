/*
USE master
go
DROP DATABASE OrderSystem
*/
CREATE DATABASE OrderSystem
GO
USE OrderSystem
GO

Create TABLE Customer
(
    ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CustomerName varchar(35) NOT Null,
    Addres VARCHAR(50) NOT NULL,
    City varchar(25) NOT Null,
    STATE char(2) Not Null,
    ZipCode int
)
GO

CREATE TABLE IntentoryItem
(
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ItemName VARCHAR(50),
    Price MONEY
)
GO

CREATE TABLE Color
(
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Color VARCHAR(20) NOT NULL
)
GO

CREATE TABLE Size
(
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Size VARCHAR(4)
)
GO

CREATE TABLE ItemColor
(
    ItemID int not NULL,
    ColorId int not NULL,
    PRIMARY Key(ItemId, ColorId),

    CONSTRAINT FK_ItemColor_IntentoryItem FOREIGN KEY (ItemID)
        REFERENCES dbo.IntentoryItem (ID),
    CONSTRAINT FK_ItemColor_Color FOREIGN KEY (ColorId)
        REFERENCES dbo.Color (ID)
)
GO

CREATE TABLE ItemSize
(
    ItemID INT NOT NULL,
    SizeID INT NOT NULL,
    PRIMARY KEY(ItemId, SizeId),

    CONSTRAINT FK_ItemSize_IntentoryItem FOREIGN KEY (ItemID)
        REFERENCES dbo.IntentoryItem (ID),
    CONSTRAINT FK_ItemColor_Size FOREIGN KEY (SizeID)
        REFERENCES dbo.Size (ID)
)
GO

CREATE TABLE OrderStatus
(
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    StatusName VARCHAR(30),
    StepOrder INT NOT NULL
)
GO

Create TABLE PurchaseOrder
(
    ID int IDENTITY(1,1) not NULL PRIMARY KEY,
    CustomerId int not NULL,
    OrderDate DATETIME NOT NULL,
    OrderStatusID INT NOT NULL,

    CONSTRAINT FK_PurchaseOrder_Customer FOREIGN KEY (CustomerId)
        REFERENCES dbo.Customer (ID),
    CONSTRAINT FK_PurchaseOrder_OrderStatus FOREIGN KEY (OrderStatusID)
        REFERENCES dbo.OrderStatus (ID)
)
GO

CREATE TABLE PurchaseOrderItems
(
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    PurchaseOrderID INT NOT NULL,
    IntentoryItemID INT NOT NULL,
    ColorId INT NOT NULL,
    SizeID INT NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT FK_PurchaseOrderItems_PurchaseOrder FOREIGN KEY (PurchaseOrderID)
        REFERENCES dbo.PurchaseOrder (ID),
    CONSTRAINT FK_PurchaseOrderItems_IntentoryItem FOREIGN KEY (IntentoryItemID)
        REFERENCES dbo.IntentoryItem (ID),
    CONSTRAINT FK_PurchaseOrderItems_ItemColor FOREIGN KEY (IntentoryItemID, ColorId)
        REFERENCES dbo.ItemColor (ItemID, ColorId),
    CONSTRAINT FK_PurchaseOrderItems_ItemSize FOREIGN KEY (IntentoryItemID, SizeId)
        REFERENCES dbo.ItemSize (ItemID, SizeId)
)
GO