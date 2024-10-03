DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    InvoiceNo TEXT,
    StockCode TEXT,
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice DECIMAL(10, 2),
    CustomerID INTEGER,
    Country TEXT
);

INSERT INTO Orders (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
SELECT 
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    TO_TIMESTAMP(InvoiceDate, 'MM/DD/YYYY HH24:MI'),  -- Convert InvoiceDate to TIMESTAMP
    UnitPrice,
    CustomerID,
    Country
FROM OrdersTemp;
