    <?php if(isset($_SESSION['login_user'])): ?>

    <div class="col-lg-12">
        <?php if(isset($_SESSION['document_upload']) && $_SESSION['document_upload'] == 'upload'):?>
        <div class="alert alert-success">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success!</strong> Document Upload successfully!.
        </div>
        <?php elseif(isset($_SESSION['document_upload']) && $_SESSION['document_upload'] == 'fail'): ?>
        <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Failed!</strong>Document Upload Failed, Please Try Again!.
        </div>
        <?php endif; ?>

        <?php if(isset($_SESSION['document_upload'])):
            unset($_SESSION['document_upload']); 
            endif; ?>

        <form class="form-horizontal" role="form" name="reviewform" action="news-process" method="post"
            enctype="multipart/form-data">

            <div class="form-group col-lg-12">
                <label class="control-label col-lg-2" for="title">News Title: </label>
                <div class="col-lg-10">
                    <input type="text" name="title" class="form-control isrequired" id="title" required>
                </div>
            </div>

            <div class="form-group col-lg-12">
                <label class="control-label col-lg-2" for="date">Discription: </label>
                <div class="col-lg-10">
                    <textarea type="text" rows="10" cols="1" name="description" class="form-control isrequired"
                        id="description" required></textarea>

                    <script>
                    // Initialize CKEditor
                    CKEDITOR.replace('description');
                    </script>
                </div>
            </div>

            <div class="form-group col-lg-12">
                <label class="control-label col-lg-2" for="date">Category: </label>
                <div class="col-lg-10">
                    <select name="category" id="category" class="form-control isrequired">
                        <?php

                            $newsCategoryResult = $admin->getNewsCategory();

                            while($row = $admin->fetcharray($newsCategoryResult)) {
                                $rowId = $row['id'];
                                $categoryType = $row['type'];

                            ?>
                        <option value="<?php echo $rowId ?>"><?php echo $categoryType ?></option>
                        <?php
                            }
                            ?>

                    </select>
                </div>
            </div>

            <div class="form-group col-lg-12">
                <label class="control-label col-lg-2" for="file">Image:</label>
                <div class="col-lg-10">
                    <input type="file" name="file" class="form-control" id="file">
                </div>
            </div>

            <div class="form-group col-lg-12">
                <label class="control-label col-lg-2"></label>
                <div class="col-lg-10">
                    <label class="control-label" style="color: red">Select only .jpg / .png
                        File.</label>
                </div>
            </div>

            <div class="form-group col-lg-12">
                <label class="control-label col-lg-2" for="date">Date: </label>
                <div class="col-lg-10">
                    <input type="date" name="date" class="form-control isrequired" value="<?php echo date("Y-m-d"); ?>"
                        id="date" required>
                </div>
            </div>

            <div class="form-group col-lg-12">
                <label class="control-label col-lg-2" for="email">&nbsp;</label>
                <div class="col-lg-10">
                    <input type="submit" name="submitdocumentform" class="btn btn-primary pull-right"
                        id="submitdocumentform">
                </div>
            </div>
        </form>

        </br>
        </br>

        <?php endif; ?>