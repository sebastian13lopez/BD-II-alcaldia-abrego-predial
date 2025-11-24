-- 1) OWNER
INSERT INTO owner (document_type, document_number, first_name, last_name, address, phone, email)
SELECT
  'CC',
  (ARRAY[
    '1023456789','987654321','1145892376','748392015','1002938475',
    '958473021','1130495827','729384651','1059483726','864203957',
    '1048372916','928374510','1193846752','783920465','1075928341',
    '936204857','1157382946','803947251','1092837456','748201963',
    '1104859273','972840315','1174928350','853920741','1039482756',
    '924857301','1183749502','763829405','1019482736','895720463',
    '1128374950','743829015','1064829375','904857231','1163728495',
    '782940613','1082937451','948372015','1139482750','864739205',
    '1029483751','973840215','1192837406','853749201','1047293846',
    '928475013','1183746920','764829301','1074829305','903847621',
    '1142938750','849372065','1084739201','937502841','1165938472',
    '784920361','1059384720','928374615','1102948573','863920475',
    '1039482765','974820631','1174938025','859374201','1019487235',
    '946205873','1129483750','784920153','1062938475','923847510',
    '1182039476','765839204','1083749506','938475102','1159483720',
    '804937265','1048375926','972638405','1192048753','853920647',
    '1029374851','948375201','1148392756','763940581','1092834765',
    '927483015','1162039487','895720315','1074823950','946203875',
    '1137485920','803947126','1083745629','928374156','1174839205',
    '759384620','1062948375','935748201','1183749052','843920756'
  ])[g],
  (ARRAY[
    'Carlos','María','Juan','Ana','Luis','Laura','Pedro','Sofía','Andrés','Camila',
    'Diego','Paula','Julián','Natalia','Esteban','Valentina','Sergio','Daniela','Miguel','Karen',
    'Felipe','Lina','Jhon','Yuliana','Óscar','Sandra','Rafael','Mayra','Brayan','Lizeth',
    'Cristian','Ángela','Eduardo','Jenny','Manuel','Karla','Mateo','Melissa','Samuel','Verónica',
    'Fernando','Gloria','Iván','Luz','Robinson','Yesica','Jorge','Patricia','Héctor','Eliana',
    'Camilo','Luisa','Ricardo','Viviana','Alejandro','Nohelia','Kevin','Mónica','Henry','Carolina',
    'Mauricio','Adriana','Anderson','Tatiana','Nelson','Rocío','Wilmer','Ingrid','Sebastián','Nicol',
    'Harold','Diana','Hernán','Claudia','Julio','Nancy','Gustavo','Beatriz','Omar','Silvia',
    'Javier','Ruth','Edgar','Martha','Ramiro','Catalina','Diego F','Marisol','Leonardo','Yenny',
    'Elkin','Milena','Saúl','Dayana','Freddy','Jennifer','Alexis','Sindy','Víctor','Joana'
  ])[g] AS first_name,
  (ARRAY[
    'Torrado','González','Rodríguez','Pérez','Gómez','Castellanos','López','Ramírez','Hernández','Rojas',
    'Martínez','Suárez','Ortiz','Castro','Salazar','Romero','Guerrero','Mora','Niño','Navarro',
    'León','Cabrera','Díaz','Correa','Mejía','Montes','Carrillo','Celis','Florido','Molina',
    'Bustos','Parra','Vega','Trujillo','Acosta','Bonilla','Escobar','Rivera','Fonseca','Cifuentes',
    'Valencia','Vargas','Galvis','Tapias','Patiño','Chacón','Silva','Barrera','Tamayo','Fuentes',
    'Peña','Beltrán','Pardo','Murillo','Santos','Salcedo','Herrera','Fajardo','Rincón','Forero',
    'Arias','Peralta','Villamizar','Cortez','Sánchez','Camacho','Reyes','Córdoba','Quiroga','Suárez',
    'Montoya','Zambrano','Prada','Serrano','Bermúdez','Soto','Escamilla','Cárdenas','Avendaño','Chaparro',
    'Useche','Lizarazo','Monsalve','Barbosa','Jaimes','Rangel','Rey','Santamaría','Quintero','Barón',
    'Salamanca','Pinto','Galeano','Cantor','Acero','Peñuela','Calderón','Trillos','Castiblanco','Plata'
  ])[g] AS last_name,
  (
    CASE WHEN g % 2 = 0 THEN 'Calle ' ELSE 'Carrera ' END ||
    ((g * 11) % 40 + 1) || ' # ' ||
    ((g * 5) % 30 + 1) || '-' ||
    ((g * 7) % 20 + 1) ||
    ', Barrio ' ||
    (ARRAY[
      'Santa Bárbara','San Carlos','13 de marzo','El amparo','San Antonio',
      'La inmaculada','Cajotal','La 18','La piñuela','La estrella',
      'La ceiba','Isabel Celis','San rafael','Villa del rosario','Pablo sexto',
      'La torcoroma','Bolivar','Kennedy'
    ])[ ((g * 3) % 18) + 1 ]
  ) AS address,
  (
    (ARRAY['300','301','302','304','305','310','311','312','313','314',
           '315','316','317','318','319','320','321','322','323'])[ ((g * 3) % 19) + 1 ]
    || LPAD( ((g * 791) % 9000000 + 1000000)::text, 7, '0')
  ) AS phone,
  LOWER(
    REPLACE((ARRAY[
      'Carlos','María','Juan','Ana','Luis','Laura','Pedro','Sofía','Andrés','Camila',
      'Diego','Paula','Julián','Natalia','Esteban','Valentina','Sergio','Daniela','Miguel','Karen',
      'Felipe','Lina','Jhon','Yuliana','Óscar','Sandra','Rafael','Mayra','Brayan','Lizeth',
      'Cristian','Ángela','Eduardo','Jenny','Manuel','Karla','Mateo','Melissa','Samuel','Verónica',
      'Fernando','Gloria','Iván','Luz','Robinson','Yesica','Jorge','Patricia','Héctor','Eliana',
      'Camilo','Luisa','Ricardo','Viviana','Alejandro','Nohelia','Kevin','Mónica','Henry','Carolina',
      'Mauricio','Adriana','Anderson','Tatiana','Nelson','Rocío','Wilmer','Ingrid','Sebastián','Nicol',
      'Harold','Diana','Hernán','Claudia','Julio','Nancy','Gustavo','Beatriz','Omar','Silvia',
      'Javier','Ruth','Edgar','Martha','Ramiro','Catalina','Diego F','Marisol','Leonardo','Yenny',
      'Elkin','Milena','Saúl','Dayana','Freddy','Jennifer','Alexis','Sindy','Víctor','Joana'
    ])[g], ' ', '')
    || '.'
    || REPLACE((ARRAY[
      'Torrado','González','Rodríguez','Pérez','Gómez','Castellanos','López','Ramírez','Hernández','Rojas',
      'Martínez','Suárez','Ortiz','Castro','Salazar','Romero','Guerrero','Mora','Niño','Navarro',
      'León','Cabrera','Díaz','Correa','Mejía','Montes','Carrillo','Celis','Florido','Molina',
      'Bustos','Parra','Vega','Trujillo','Acosta','Bonilla','Escobar','Rivera','Fonseca','Cifuentes',
      'Valencia','Vargas','Galvis','Tapias','Patiño','Chacón','Silva','Barrera','Tamayo','Fuentes',
      'Peña','Beltrán','Pardo','Murillo','Santos','Salcedo','Herrera','Fajardo','Rincón','Forero',
      'Arias','Peralta','Villamizar','Cortez','Sánchez','Camacho','Reyes','Córdoba','Quiroga','Suárez',
      'Montoya','Zambrano','Prada','Serrano','Bermúdez','Soto','Escamilla','Cárdenas','Avendaño','Chaparro',
      'Useche','Lizarazo','Monsalve','Barbosa','Jaimes','Rangel','Rey','Santamaría','Quintero','Barón',
      'Salamanca','Pinto','Galeano','Cantor','Acero','Peñuela','Calderón','Trillos','Castiblanco','Plata'
    ])[g], ' ', '')
    || '@gmail.com'
  ) AS email
FROM generate_series(1, 100) AS g;


-- 2) PROPERTY
INSERT INTO property
(cadastral_code, address, land_area, built_area, property_type, stratum, neighborhood)
SELECT
  '54003000' || LPAD(g::text, 6, '0') AS cadastral_code,
  (
    CASE WHEN g % 2 = 0 THEN 'Calle ' ELSE 'Carrera ' END ||
    ((g * 11) % 40 + 1) || ' # ' ||
    ((g * 5) % 30 + 1) || '-' ||
    ((g * 7) % 20 + 1) ||
    ', Barrio ' ||
    (ARRAY[
      'Santa Bárbara','San Carlos','13 de marzo','El amparo','San Antonio',
      'La inmaculada','Cajotal','La 18','La piñuela','La estrella',
      'La ceiba','Isabel Celis','San rafael','Villa del rosario','Pablo sexto',
      'La torcoroma','Bolivar','Kennedy'
    ])[ ((g * 3) % 18) + 1 ]
  ) AS address,
  (80 + (g * 13) % 220)::numeric(10,2) AS land_area,
  (50 + (g * 9) % 180)::numeric(10,2)  AS built_area,
  CASE
    WHEN g = 1 THEN 'CENTRO COMERCIAL'
    WHEN g % 10 IN (0,1,2,3,4,5,6) THEN 'CASA'
    WHEN g % 10 IN (7,8)           THEN 'NEGOCIO'
    ELSE 'BODEGA'
  END AS property_type,
  ((g * 2) % 6) + 1 AS stratum,
  (ARRAY[
    'Santa Bárbara','San Carlos','13 de marzo','El amparo','San Antonio',
    'La inmaculada','Cajotal','La 18','La piñuela','La estrella',
    'La ceiba','Isabel Celis','San rafael','Villa del rosario','Pablo sexto',
    'La torcoroma','Bolivar','Kennedy'
  ])[ ((g * 5) % 18) + 1 ] AS neighborhood
FROM generate_series(1, 100) AS g;

-- 3) PROPERTY_OWNER
INSERT INTO property_owner (property_id, owner_id)
SELECT g AS property_id, g AS owner_id
FROM generate_series(1, 100) AS g;

-- 4) TAX_LIQUIDATION
INSERT INTO tax_liquidation
(property_id, tax_year, period, base_value, rate,
 tax_amount, surcharges, discounts, total_amount, due_date, status)
SELECT
  ((g - 1) % 100) + 1 AS property_id,
  2019 + ((g - 1) % 7) AS tax_year,
  'ANUAL' AS period,
  CASE
    WHEN p.property_type = 'CASA'    THEN (80000000 + g * 5000)
    WHEN p.property_type = 'NEGOCIO' THEN (120000000 + g * 7000)
    WHEN p.property_type = 'BODEGA'  THEN (150000000 + g * 9000)
    ELSE                                  (250000000 + g * 12000)
  END AS base_value,
  0.008 AS rate,
  ROUND(
    CASE
      WHEN p.property_type = 'CASA'    THEN (80000000 + g * 5000) * 0.008
      WHEN p.property_type = 'NEGOCIO' THEN (120000000 + g * 7000) * 0.008
      WHEN p.property_type = 'BODEGA'  THEN (150000000 + g * 9000) * 0.008
      ELSE                                  (250000000 + g * 12000) * 0.008
    END
  ) AS tax_amount,
  CASE WHEN g % 10 = 0 THEN 30000
       WHEN g % 10 = 1 THEN 60000
       ELSE 0 END AS surcharges,
  CASE WHEN g % 15 = 0 THEN 50000
       WHEN g % 15 = 1 THEN 30000
       ELSE 0 END AS discounts,
  ROUND(
    CASE
      WHEN p.property_type = 'CASA'    THEN (80000000 + g * 5000) * 0.008
      WHEN p.property_type = 'NEGOCIO' THEN (120000000 + g * 7000) * 0.008
      WHEN p.property_type = 'BODEGA'  THEN (150000000 + g * 9000) * 0.008
      ELSE                                  (250000000 + g * 12000) * 0.008
    END
  )
  + CASE WHEN g % 10 = 0 THEN 30000
         WHEN g % 10 = 1 THEN 60000
         ELSE 0 END
  - CASE WHEN g % 15 = 0 THEN 50000
         WHEN g % 15 = 1 THEN 30000
         ELSE 0 END AS total_amount,
  DATE ((2019 + ((g - 1) % 7)) || '-03-31') AS due_date,
  CASE
    WHEN g % 6 = 0 THEN 'PAGADO'
    WHEN g % 6 = 1 THEN 'PENDIENTE'
    WHEN g % 6 = 2 THEN 'VENCIDO'
    WHEN g % 6 = 3 THEN 'EN_ACUERDO'
    WHEN g % 6 = 4 THEN 'SUSPENDIDO'
    ELSE 'EN_REVISION'
  END AS status
FROM generate_series(1, 1000) AS g
JOIN property p ON p.property_id = ((g - 1) % 100) + 1;


-- 5) NOTIFICATION_HISTORY
INSERT INTO notification_history
(liquidation_id, notification_date, notification_type, channel_detail, status)
SELECT
  tl.liquidation_id,
  (DATE (tl.tax_year || '-02-01') + ((g * 3) % 60))::date AS notification_date,
  (ARRAY['CORREO','CARTA','MENSAJE_SMS'])[(g % 3) + 1]     AS notification_type,
  CASE
    WHEN g % 3 = 0 THEN COALESCE(o.email, 'sin_correo@abrego.gov.co')
    WHEN g % 3 = 1 THEN COALESCE(o.address, p.address)
    ELSE              COALESCE(o.phone, '3000000000')
  END AS channel_detail,
  CASE
    WHEN g % 4 = 0 THEN 'ENTREGADA'
    WHEN g % 4 = 1 THEN 'DEVUELTA'
    ELSE 'ENVIADA'
  END AS status
FROM generate_series(1, 1000) AS g
JOIN tax_liquidation tl ON tl.liquidation_id = ((g - 1) % 1000) + 1
JOIN property p        ON p.property_id      = tl.property_id
JOIN property_owner po ON po.property_id     = p.property_id
JOIN owner o           ON o.owner_id         = po.owner_id;


-- 6) PAYMENT
INSERT INTO payment
(liquidation_id, payment_date, amount_paid, payment_method, receipt_number, payment_status)
SELECT
  tl.liquidation_id,
  (DATE (tl.tax_year || '-03-01') + ((g * 5) % 120))::date AS payment_date,
  CASE
    WHEN g % 5 = 0 THEN ROUND(tl.total_amount * 0.5)
    WHEN g % 5 = 1 THEN ROUND(tl.total_amount * 0.75)
    ELSE tl.total_amount
  END AS amount_paid,
  (ARRAY['EFECTIVO','PSE','CORRESPONSAL'])[(g % 3) + 1] AS payment_method,
  'REC-' || LPAD(g::text, 6, '0') AS receipt_number,
  CASE
    WHEN g % 9 = 0 THEN 'PEND_CONFIRM'
    WHEN g % 5 = 0 THEN 'PARCIAL'
    ELSE 'CONFIRMADO'
  END AS payment_status
FROM generate_series(1, 1000) AS g
JOIN tax_liquidation tl ON tl.liquidation_id = ((g - 1) % 1000) + 1;
