  SET search_path = hq, pg_catalog;
  --
  -- Name: activate_defence_matrix(); Type: FUNCTION; Schema: hq; Owner: steve
  --

  CREATE OR REPLACE FUNCTION hq.activate_defence_matrix() RETURNS void
  LANGUAGE plpgsql SECURITY DEFINER
  AS $$
    DECLARE
      pilot_ids integer[];
    BEGIN
      SELECT id INTO pilot_ids FROM units WHERE type = 'cannon_pilot';
    END
  $$;
