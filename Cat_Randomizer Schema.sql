CREATE TABLE "saved_cats" (
    "ID" SERIAL   NOT NULL,
    "Image_url" TEXT   NOT NULL,
    "Fact" TEXT   NOT NULL,
    "Saved_at" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_saved_cats" PRIMARY KEY (
        "ID"
     ),
    CONSTRAINT "uc_saved_cats_Image_url" UNIQUE (
        "Image_url"
    ),
    CONSTRAINT "uc_saved_cats_Fact" UNIQUE (
        "Fact"
    )
);

