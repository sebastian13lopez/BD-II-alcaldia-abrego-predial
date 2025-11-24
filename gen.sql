-- ==========================================
-- Auditoría de cambios en pagos (PAYMENT)
-- ==========================================

-- 1) Tabla de auditoría
CREATE TABLE payment_audit (
  audit_id       SERIAL PRIMARY KEY,
  payment_id     INTEGER,
  liquidation_id INTEGER,
  old_amount     NUMERIC(12,2),
  new_amount     NUMERIC(12,2),
  old_status     VARCHAR(20),
  new_status     VARCHAR(20),
  operation      VARCHAR(10),          -- INSERT / UPDATE / DELETE
  changed_at     TIMESTAMP NOT NULL DEFAULT now(),
  changed_by     TEXT       NOT NULL DEFAULT current_user
);

-- 2) Función de trigger
CREATE OR REPLACE FUNCTION fn_payment_audit()
RETURNS TRIGGER AS
$$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO payment_audit (
      payment_id, liquidation_id,
      old_amount, new_amount,
      old_status, new_status,
      operation
    )
    VALUES (
      NEW.payment_id, NEW.liquidation_id,
      NULL, NEW.amount_paid,
      NULL, NEW.payment_status,
      'INSERT'
    );
    RETURN NEW;

  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO payment_audit (
      payment_id, liquidation_id,
      old_amount, new_amount,
      old_status, new_status,
      operation
    )
    VALUES (
      NEW.payment_id, NEW.liquidation_id,
      OLD.amount_paid, NEW.amount_paid,
      OLD.payment_status, NEW.payment_status,
      'UPDATE'
    );
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO payment_audit (
      payment_id, liquidation_id,
      old_amount, new_amount,
      old_status, new_status,
      operation
    )
    VALUES (
      OLD.payment_id, OLD.liquidation_id,
      OLD.amount_paid, NULL,
      OLD.payment_status, NULL,
      'DELETE'
    );
    RETURN OLD;
  END IF;

  RETURN NULL;
END;
$$
LANGUAGE plpgsql;

-- 3) Trigger sobre PAYMENT
CREATE TRIGGER tr_payment_audit
AFTER INSERT OR UPDATE OR DELETE ON payment
FOR EACH ROW
EXECUTE FUNCTION fn_payment_audit();
