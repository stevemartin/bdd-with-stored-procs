  SET search_path = report, public, pg_catalog;
  --
  -- Name: rebuild_loan_book_summary(); Type: FUNCTION; Schema: report; Owner: chris
  --

  CREATE OR REPLACE FUNCTION generate_user_report() RETURNS void
  LANGUAGE plpgsql SECURITY DEFINER
    AS $$
    DECLARE
      r record;
    BEGIN
    END
  $$;
