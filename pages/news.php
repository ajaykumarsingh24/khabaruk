<!DOCTYPE html>
<html>

<?php
    require_once '../include/common.php';
    include './header.php';    
?>

<body>
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>
    <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
    <div class="container">
        <header id="header">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="header_top">
                        <div class="header_top_left">
                            <ul class="top_nav">
                                <li><a href="home">Home</a></li>
                                <li><a href="contact-us">Contact</a></li>
                            </ul>
                        </div>
                        <div class="header_top_right">
                            <p><?php echo date('D') . ', ' . date('M') . ' ' . date('d') . ', '. date('Y') ?></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="header_bottom">
                        <div class="logo_area"><a href="index.html" class="logo"><img
                                    src="<?=URL?>/assets/images/logo.jpg" alt=""></a>
                        </div>
                        <div class="add_banner"><a href="#"><img src="<?=URL?>/assets/images/addbanner_728x90_V1.jpg"
                                    alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <?php
            include './menu.php';
        ?>
        <section id="contentSection">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="left_content">
                        <div class="contact_area">
                            <h2>Add News</h2>

                            <?php include 'add_news.php'; ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php include './footer.php' ?>
</body>

</html>