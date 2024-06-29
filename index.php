<!DOCTYPE html>
<html>

<?php
    require_once './include/common.php';
    require_once './pages/header.php';    
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
                                <li><a href="contact">Contact</a></li>
                            </ul>
                        </div>
                        <div class="header_top_right">
                            <p><?php echo date('D') . ', ' . date('M') . ' ' . date('d') . ', '. date('Y') ?></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="header_bottom">
                        <div class="logo_area"><a href="home" class="logo"><img src="<?=URL?>/assets/images/logo.jpg"
                                    alt=""></a>
                        </div>
                        <div class="add_banner"><a href="#"><img src="<?=URL?>/assets/images/addbanner_728x90_V1.jpg"
                                    alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <?php
            include 'pages/menu.php';
            include 'pages/latest-news.php';
        ?>

        <section id="sliderSection">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <div class="slick_slider">
                        <?php

                        $admin->getAllNews();

                        ?>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="latest_post">
                        <h2><span>Latest post</span></h2>
                        <div class="latest_post_container">
                            <div id="prev-button"><i class="fa fa-chevron-up"></i></div>
                            <ul class="latest_postnav">
                                <?php $admin->getLatestPost(2); ?>
                            </ul>
                            <div id="next-button"><i class="fa  fa-chevron-down"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="contentSection">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <div class="left_content">
                        <?php include 'pages/viral-news.php' ?>

                        <div class="fashion_technology_area">
                            <?php include 'pages/uttrakhand-news.php' ?>
                            <?php include 'pages/rishikesh-news.php' ?>
                        </div>
                        <div class="single_post_content">
                            <h2><span>Photography</span></h2>
                            <ul class="photograph_nav  wow fadeInDown">
                                <li>
                                    <div class="photo_grid">
                                        <figure class="effect-layla"> <a class="fancybox-buttons"
                                                data-fancybox-group="button"
                                                href="<?=URL?>/assets/images/photogallery1.PNG"
                                                title="Photography Ttile 1"> <img
                                                    src="<?=URL?>/assets/images/photogallery1.PNG" alt="" /></a>
                                        </figure>
                                    </div>
                                </li>
                                <li>
                                    <div class="photo_grid">
                                        <figure class="effect-layla"> <a class="fancybox-buttons"
                                                data-fancybox-group="button"
                                                href="<?=URL?>/assets/images/photogallery2.PNG"
                                                title="Photography Ttile 2"> <img
                                                    src="<?=URL?>/assets/images/photogallery2.PNG" alt="" /> </a>
                                        </figure>
                                    </div>
                                </li>
                                <li>
                                    <div class="photo_grid">
                                        <figure class="effect-layla"> <a class="fancybox-buttons"
                                                data-fancybox-group="button"
                                                href="<?=URL?>/assets/images/photogallery3.PNG"
                                                title="Photography Ttile 3"> <img
                                                    src="<?=URL?>/assets/images/photogallery3.PNG" alt="" /> </a>
                                        </figure>
                                    </div>
                                </li>
                                <li>
                                    <div class="photo_grid">
                                        <figure class="effect-layla"> <a class="fancybox-buttons"
                                                data-fancybox-group="button"
                                                href="<?=URL?>/assets/images/photogallery4.PNG"
                                                title="Photography Ttile 4"> <img
                                                    src="<?=URL?>/assets/images/photogallery4.PNG" alt="" /> </a>
                                        </figure>
                                    </div>
                                </li>
                                <li>
                                    <div class="photo_grid">
                                        <figure class="effect-layla"> <a class="fancybox-buttons"
                                                data-fancybox-group="button"
                                                href="<?=URL?>/assets/images/photogallery4.PNG"
                                                title="Photography Ttile 5"> <img
                                                    src="<?=URL?>/assets/images/photogallery4.PNG" alt="" /> </a>
                                        </figure>
                                    </div>
                                </li>
                                <li>
                                    <div class="photo_grid">
                                        <figure class="effect-layla"> <a class="fancybox-buttons"
                                                data-fancybox-group="button"
                                                href="<?=URL?>/assets/images/photogallery4.PNG"
                                                title="Photography Ttile 6"> <img
                                                    src="<?=URL?>/assets/images/photogallery4.PNG" alt="" /> </a>
                                        </figure>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <?php include 'pages/rajniti-news.php' ?>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <aside class="right_content">
                        <?php include 'pages/popular-post.php' ?>
                        <div class="single_sidebar">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#category" aria-controls="home"
                                        role="tab" data-toggle="tab">Category</a></li>
                                <li role="presentation"><a href="#video" aria-controls="profile" role="tab"
                                        data-toggle="tab">Video</a></li>
                                <li role="presentation"><a href="#comments" aria-controls="messages" role="tab"
                                        data-toggle="tab">Comments</a></li>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="category">
                                    <ul>
                                        <?php $admin->getAllCategory(); ?>
                                    </ul>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="video">
                                    <div class="vide_area">
                                        <iframe width="100%" height="250"
                                            src="http://www.youtube.com/embed/h5QWbURNEpA?feature=player_detailpage"
                                            frameborder="0" allowfullscreen></iframe>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="comments">
                                    <ul class="spost_nav">
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="pages/single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img1.jpg">
                                                </a>
                                                <div class="media-body"> <a href="pages/single_page.html"
                                                        class="catg_title"> Aliquam malesuada diam eget turpis varius
                                                        1</a> </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="pages/single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img2.jpg">
                                                </a>
                                                <div class="media-body"> <a href="pages/single_page.html"
                                                        class="catg_title"> Aliquam malesuada diam eget turpis varius
                                                        2</a> </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="pages/single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img1.jpg">
                                                </a>
                                                <div class="media-body"> <a href="pages/single_page.html"
                                                        class="catg_title"> Aliquam malesuada diam eget turpis varius
                                                        3</a> </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="pages/single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img2.jpg">
                                                </a>
                                                <div class="media-body"> <a href="pages/single_page.html"
                                                        class="catg_title"> Aliquam malesuada diam eget turpis varius
                                                        4</a> </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="single_sidebar wow fadeInDown">
                            <h2><span>Sponsor</span></h2>
                            <a class="sideAdd" href="#"><img src="<?=URL?>/assets/images/add_img.jpg" alt=""></a>
                        </div>
                        <div class="single_sidebar wow fadeInDown">
                            <h2><span>Category Archive</span></h2>
                            <select class="catgArchive">
                                <option>Select Category</option>
                                <?php $admin->getBindCategoryOption();
                                ?>
                            </select>
                        </div>
                        <div class="single_sidebar wow fadeInDown">
                            <h2><span>Links</span></h2>
                            <ul>
                                <?php if(isset($_SESSION['login_user'])): ?>
                                <li class="last"><a href="news-logout">Logout</a></li>
                                <?php else: ?>
                                <li><a href="news-login">Login</a></li>
                                <?php endif; ?>
                            </ul>
                        </div>
                    </aside>
                </div>
            </div>
        </section>

        <?php include './pages/footer.php' ?>

</body>

</html>