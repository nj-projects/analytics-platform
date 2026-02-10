-- Customers
CREATE TABLE customers (
                           id UUID PRIMARY KEY,
                           name TEXT NOT NULL,
                           email TEXT UNIQUE NOT NULL,
                           created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Products
CREATE TABLE products (
                          id UUID PRIMARY KEY,
                          name TEXT NOT NULL,
                          price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
                          created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Inventory
CREATE TABLE inventory (
                           product_id UUID PRIMARY KEY REFERENCES products(id),
                           quantity INT NOT NULL CHECK (quantity >= 0),
                           updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Orders
CREATE TABLE orders (
                        id UUID PRIMARY KEY,
                        customer_id UUID NOT NULL REFERENCES customers(id),
                        order_date DATE NOT NULL,
                        status TEXT NOT NULL,
                        created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Order Items
CREATE TABLE order_items (
                             id UUID PRIMARY KEY,
                             order_id UUID NOT NULL REFERENCES orders(id),
                             product_id UUID NOT NULL REFERENCES products(id),
                             quantity INT NOT NULL CHECK (quantity > 0),
                             unit_price NUMERIC(10,2) NOT NULL
);

-- Shipments
CREATE TABLE shipments (
                           id UUID PRIMARY KEY,
                           order_id UUID NOT NULL REFERENCES orders(id),
                           shipped_at TIMESTAMP,
                           delivered_at TIMESTAMP,
                           status TEXT NOT NULL
);

-- Indexes
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_shipments_status ON shipments(status);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
