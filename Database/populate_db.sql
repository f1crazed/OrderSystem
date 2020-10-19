USE OrderSystem
GO

INSERT INTO Customer
(
    CustomerName,
    Addres,
    City,
    STATE,
    ZipCode
)
VALUES
('ABC Co.', '123 Big St.', 'Big City', 'MI', 48023),
('XYZ INC.', '789 Little St.', 'Little City', 'WA', 98033),
('LMNOP LLC.', '772 Long Ave.', 'Uptown Place', 'MI', 48012)
GO

INSERT INTO Color
(
    Color
)
VALUES
('Red'),
('Green'),
('Blue'),
('Orange'),
('Purple'),
('Yellow'),
('Light Blue'),
('Navy'),
('Black'),
('White')
GO

INSERT INTO Size
(
    Size
)
VALUES
('XS'),
('S'),
('M'),
('L'),
('XL'),
('XL'),
('XXL')
GO
