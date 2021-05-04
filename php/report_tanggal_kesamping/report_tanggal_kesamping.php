<?php
ini_set('display_errors',0);
error_reporting(0);
require_once('koneksi_report_tanggal_kesamping.php');

$str=$koneksi->query('select * from test');
$res=$str->fetchAll();
foreach ($res as $val) {
	$arraybarang[$val['barang']]=$val['barang'];
	$arraytanggal[$val['tanggal']]=$val['tanggal'];

	$data[$val['barang']][$val['tanggal']]+=1;
}

$coltgl=count($arraytanggal);
echo '<br>';
var_dump($coltgl);
echo '<br>';

echo "<table border=1>
		<thead>
		<tr>
			<th rowspan=2>barang</th>
			<th colspan=$coltgl>tanggal</th>
		</tr>
		<tr>";

foreach($arraytanggal as $tanggal){
	echo "<th>".$tanggal."</th>";
}
echo "</tr></thead>";

echo "<tbody>";
foreach ($arraybarang as $barang) {
	echo "<tr>
		<td>".$barang."</td>";
		foreach ($arraytanggal as $tanggal) {
			echo "<td>".number_format($data[$barang][$tanggal])."</td>";
		}
	echo "</tr>";
}
echo "</tbody> </table>";

?>