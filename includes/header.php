<?php
declare(strict_types=1);
$currentPage = basename($_SERVER['PHP_SELF'] ?? '');
?>
<!DOCTYPE html>
<html lang="sw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= e($pageTitle ?? 'Maktaba') ?> — Library MS</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<header class="app-header">
    <a href="index.php" class="logo">📚 Maktaba Digital</a>
    <nav class="nav-links">
        <a href="index.php" class="<?= $currentPage === 'index.php' ? 'active' : '' ?>">Dashibodi</a>
        <a href="books.php" class="<?= $currentPage === 'books.php' ? 'active' : '' ?>">Vitabu</a>
        <a href="borrow.php" class="<?= $currentPage === 'borrow.php' ? 'active' : '' ?>">Kopa Kitabu</a>
        <a href="my_borrows.php" class="<?= $currentPage === 'my_borrows.php' ? 'active' : '' ?>">Mikopo Yangu</a>
        <?php if (isAdmin()): ?>
            <a href="manage_books.php" class="<?= $currentPage === 'manage_books.php' ? 'active' : '' ?>">Simamia Vitabu</a>
        <?php endif; ?>
        <span class="user-badge"><?= e($_SESSION['fullname'] ?? '') ?></span>
        <a href="logout.php">Toka</a>
    </nav>
</header>
<main class="container">
