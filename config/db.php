<?php
declare(strict_types=1);

$dbHost = 'localhost';
$dbName = 'library_db';
$dbUser = 'root';
$dbPass = '';

$dsn = "mysql:host={$dbHost};dbname={$dbName};charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $dbUser, $dbPass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]);
} catch (PDOException $e) {
    http_response_code(500);
    die('Hitilafu ya muunganisho wa database. Hakikisha MySQL inaendesha na umeimport library/database/library.sql');
}
