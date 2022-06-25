class AddGeometricIndexes < ActiveRecord::Migration[7.0]
  def up
    execute <<~SQL.squish
      CREATE INDEX IF NOT EXISTS customer_orders_geom_idx
          ON customer_orders USING gist
          (geom);
      CREATE INDEX IF NOT EXISTS customer_orders_geom_ua_idx
          ON customer_orders USING gist
          (ST_Transform(geom, 5558));
      CREATE INDEX IF NOT EXISTS customer_orders_geog_idx
          ON customer_orders USING gist
          (GEOGRAPHY(geom));
    SQL
  end

  def down
    execute <<~SQL.squish
      DROP INDEX IF EXISTS customer_orders_geom_idx;
      DROP INDEX IF EXISTS customer_orders_geom_ua_idx;
      DROP INDEX IF EXISTS customer_orders_geog_idx;
    SQL
  end
end
