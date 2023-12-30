-- Adding province column
ALTER TABLE universities
ADD COLUMN province VARCHAR;

ALTER TABLE universities
ADD CONSTRAINT pk_province PRIMARY KEY (province);

-- Adding each universities with corresponding province
UPDATE universities
SET province =
	CASE
		WHEN university_name IN (
			'UNIVERSITAS SYIAH KUALA', 'UNIVERSITAS MALIKUSSALEH',
			'UNIVERSITAS TEUKU UMAR', 'UNIVERSITAS SAMUDRA',
			'ISBI ACEH', 'UNIVERSITAS ISLAM NEGERI AR-RANIRY'
		) THEN 'Aceh'
		
		WHEN university_name IN (
            'UNIVERSITAS SUMATERA UTARA', 'UNIVERSITAS NEGERI MEDAN', 'UNIVERSITAS ISLAM NEGERI SUMATERA UTARA'
        ) THEN 'Sumatera Utara'
        
        WHEN university_name IN (
            'UNIVERSITAS RIAU', 'UNIVERSITAS ISLAM NEGERI SULTAN SYARIF KASIM'
        ) THEN 'Riau'
		
		WHEN university_name IN (
            'UNIVERSITAS MARITIM RAJA ALI HAJI'
        ) THEN 'Kepulauan Riau'
		
		WHEN university_name IN (
            'UNIVERSITAS ANDALAS', 'UNIVERSITAS NEGERI PADANG', 'ISI PADANG PANJANG'
        ) THEN 'Sumatera Barat'
        
        WHEN university_name IN (
            'UNIVERSITAS JAMBI'
        ) THEN 'Jambi'
        
        WHEN university_name IN (
            'UNIVERSITAS BENGKULU'
        ) THEN 'Bengkulu'
		
		WHEN university_name IN (
            'UNIVERSITAS SRIWIJAYA', 'UNIVERSITAS ISLAM NEGERI RADEN FATAH'
        ) THEN 'Sumatera Selatan'
		
		WHEN university_name IN (
            'UNIVERSITAS BANGKA BELITUNG'
        ) THEN 'Kepulauan Bangka Belitung'
		
		WHEN university_name IN (
            'UNIVERSITAS LAMPUNG', 'INSTITUT TEKNOLOGI SUMATERA'
        ) THEN 'Lampung'
		
		WHEN university_name IN (
            'UNIVERSITAS SULTAN AGENG TIRTAYASA'
        ) THEN 'Banten'
		
		WHEN university_name IN (
            'UNIVERSITAS INDONESIA', 'UNIVERSITAS SINGAPERBANGSA KARAWANG', 'INSTITUT TEKNOLOGI BANDUNG',
			'UNIVERSITAS PADJADJARAN', 'UNIVERSITAS PENDIDIKAN INDONESIA', 'ISBI BANDUNG',
			'UNIVERSITAS ISLAM NEGERI SUNAN GUNUNG DJATI', 'INSTITUT PERTANIAN BOGOR',
			'UNIVERSITAS SILIWANGI'
		) THEN 'Jawa Barat'
		
		WHEN university_name IN (
			'UNIVERSITAS ISLAM NEGERI JAKARTA', 'UNIVERSITAS NEGERI JAKARTA', 'UPN "VETERAN" JAKARTA'
		) THEN 'DKI Jakarta'
		
		WHEN university_name IN (
            'UNIVERSITAS JENDERAL SOEDIRMAN', 'UNIVERSITAS TIDAR', 'UNIVERSITAS SEBELAS MARET',
			'ISI SURAKARTA', 'UNIVERSITAS DIPONEGORO', 'UNIVERSITAS NEGERI SEMARANG',
			'UNIVERSITAS ISLAM NEGERI WALISONGO'
		) THEN 'Jawa Tengah'
		
		WHEN university_name IN (
            'UNIVERSITAS GADJAH MADA', 'UNIVERSITAS NEGERI YOGYAKARTA', 'UPN "VETERAN" YOGYAKARTA',
			'ISI YOGYAKARTA', 'UNIVERSITAS ISLAM NEGERI SUNAN KALIJAGA'
		) THEN 'DI Yogyakarta'
		
		WHEN university_name IN (
            'UNIVERSITAS JEMBER', 'UNIVERSITAS BRAWIJAYA', 'UNIVERSITAS NEGERI MALANG',
			'UNIVERSITAS ISLAM NEGERI MALANG', 'UNIVERSITAS AIRLANGGA', 'INSTITUT TEKNOLOGI SEPULUH NOPEMBER',
			'UNIVERSITAS NEGERI SURABAYA', 'UNIVERSITAS TRUNOJOYO MADURA', 
			'UPN "VETERAN" JAWA TIMUR', 'UNIVERSITAS ISLAM NEGERI SUNAN AMPEL SURABAYA'
		) THEN 'Jawa Timur'
		
		WHEN university_name IN (
            'UNIVERSITAS TANJUNGPURA'
		) THEN 'Kalimantan Barat'
		
		WHEN university_name IN (
            'UNIVERSITAS PALANGKARAYA'
		) THEN 'Kalimantan Tengah'
		
		WHEN university_name IN (
            'UNIVERSITAS LAMBUNG MANGKURAT'
		) THEN 'Kalimantan Selatan'
		
		WHEN university_name IN (
            'UNIVERSITAS MULAWARMAN', 'INSTITUT TEKNOLOGI KALIMANTAN', 'UNIVERSITAS BORNEO TARAKAN'
		) THEN 'Kalimantan Timur'
		
		WHEN university_name IN (
            'UNIVERSITAS UDAYANA', 'UNIVERSITAS PENDIDIKAN GANESHA', 'ISI DENPASAR'
		) THEN 'Bali'
		
		WHEN university_name IN (
            'UNIVERSITAS MATARAM'
		) THEN 'Nusa Tenggara Barat'
		
		WHEN university_name IN (
            'UNIVERSITAS NUSA CENDANA', 'UNIVERSITAS TIMOR'
		) THEN 'Nusa Tenggara Timur'
		
		WHEN university_name IN (
            'UNIVERSITAS HASANUDDIN', 'UNIVERSITAS NEGERI MAKASSAR', 'UNIVERSITAS ISLAM NEGERI ALAUDDIN'
		) THEN 'Sulawesi Selatan'
		
		WHEN university_name IN (
            'UNIVERSITAS SAM RATULANGI', 'UNIVERSITAS NEGERI MANADO'
		) THEN 'Sulawesi Utara'
		
		WHEN university_name IN (
            'UNIVERSITAS TADULAKO'
		) THEN 'Sulawesi Tengah'
		
		WHEN university_name IN (
            'UNIVERSITAS SULAWESI BARAT'
		) THEN 'Sulawesi Barat'
		
		WHEN university_name IN (
            'UNIVERSITAS HALUOLEO', 'UNIVERSITAS SEMBILAN BELAS NOVEMBER KOLAKA'
		) THEN 'Sulawesi Tenggara'
		
		WHEN university_name IN (
            'UNIVERSITAS NEGERI GORONTALO'
		) THEN 'Gorontalo'
		
		WHEN university_name IN (
            'UNIVERSITAS PATTIMURA'
		) THEN 'Maluku'
		
		WHEN university_name IN (
            'UNIVERSITAS KHAIRUN'
		) THEN 'Maluku Utara'
		
		WHEN university_name IN (
            'UNIVERSITAS CENDERAWASIH', 'UNIVERSITAS MUSAMUS MERAUKE',
			'ISBI TANAH PAPUA', 'UNIVERSITAS PAPUA'
		) THEN 'Papua'
		
		ELSE NULL
	END;
	
-- Addressing Problems with the UPN universities
UPDATE universities
SET province = 'DKI Jakarta'
WHERE id_university = '324';

UPDATE universities
SET province = 'DI Yogyakarta'
WHERE id_university = '363';

UPDATE universities
SET province = 'Jawa Timur'
WHERE id_university = '385';

-- Join table with geo attributes (latitude and longitude)
UPDATE latitude_longitude
SET name = REPLACE(name, 'Provinsi ', '')
WHERE name LIKE 'Provinsi %';

-- Save the final universities table then drop and replace the current university table
CREATE TABLE IF NOT EXISTS universities_modified AS
SELECT id_university, university_name, province, geo.latitude, geo.longitude
FROM universities u
LEFT JOIN latitude_longitude geo
ON u.province = geo.name;