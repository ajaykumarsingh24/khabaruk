<section id="navArea">
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav main_nav">
                <li class="active">
                    <a href="home">
                        <span class="fa fa-home desktop-home"></span>
                        <span class="mobile-show">Home</span>
                    </a>
                </li>

                <?php $admin->getMenus(); ?>

                <?php if(isset($_SESSION['login_user'])): ?>
                <li class="last"><a href="news-logout">Logout</a></li>
                <?php endif; ?>
            </ul>
        </div>
    </nav>
</section>