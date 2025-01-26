import sqlite3

class DatabaseManager:
    def __init__(self):
        self.connection = sqlite3.connect('sample_data.sqlite')
        self.cursor = self.connection.cursor()

    def populate_data(self):
        with open('db_init.sql', 'r') as file:
            sql_script = file.read()
        self.cursor.executescript(sql_script)

    def put_order(self, item_id, quantity):
        try:
            self.cursor.execute('BEGIN TRANSACTION')

            self.cursor.execute('SELECT in_stock FROM stock WHERE id = ? AND in_stock >= ?', (item_id, quantity))
            stock = self.cursor.fetchone()
            if stock is None:
                raise ValueError("Insufficient stock or item does not exist.")
            elif quantity == 0:
                raise ValueError("0 quantity is not allowed")

            self.cursor.execute('INSERT INTO orders (quantity, item_id) VALUES (?, ?)', (quantity, item_id))
            self.cursor.execute('UPDATE stock SET in_stock = in_stock - ? WHERE id = ?', (quantity, item_id))

            self.connection.commit()
        except Exception as e:
            self.connection.rollback()
            raise e

    def get_data(self, script):
        sql = script.strip().upper()
        if sql.startswith("SELECT"):
            self.cursor.execute(sql)
            return self.cursor.fetchall()
        else:
            return "Only SELECT statements are allowed."

    def close(self):
        if self.connection:
            self.connection.close()

    def __del__(self):
        self.close()
