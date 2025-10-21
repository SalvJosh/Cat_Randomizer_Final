# User Flow Documentation

## 1. Landing Page (`/index.html`)

**Purpose:**  
The main interface where users can generate random cat images and facts.

**Files:**  
`index.html`, `script.js`

### On Load

- Displays a random cat image (from **TheCatAPI**).
- Displays a random cat fact (from **MeowFacts API**).
- Shows buttons:
  - **New Image**
  - **Save Image**
  - **New Fact**
  - **Save Fact**
  - **View Saved Cats**

### User Actions

- **New Image:** Fetches a new image from the backend (`/api/cats/image`).
- **New Fact:** Fetches a new fact from the backend (`/api/cats/fact`).
- **Save Image/Fact:** Sends a `POST` request to `/api/cats/save` to store the current image or fact in PostgreSQL.
- **View Saved Cats:** Navigates to `/saved.html`.

---

## 2. Save Functionality

**Purpose:**  
Allows users to save their favorite cat images or facts to the database.

**Backend Route:**  
`POST /api/cats/save`

### Behavior

- Validates that either an `image_url` or a `fact` is included in the request body.
- Inserts the data into the `saved_cats` table in PostgreSQL.
- Prevents duplicates using the `UNIQUE` constraint on both fields.

**Example Request:**
axios.post('/api/cats/save', {
image_url: 'https://cdn2.thecatapi.com/images/abc123.jpg',
fact: null
});

---

## 3. Saved Cats Page (`/saved.html`)

**Purpose:**  
Displays all saved cat images and facts for the user to browse and manage.

**Files:**  
`saved.html`, `saved.js`

### On Load

- Sends a `GET /api/cats/all` request to retrieve all saved cats.
- Displays results under two headings:
  - **Saved Images**
  - **Saved Facts**

### User Actions

- **Click Image/Fact:** Opens the selected item in a modal for full viewing.
- **Arrow Keys:** Use ⬅️ and ➡️ to navigate through items.
- **Delete Button:** Sends `DELETE /api/cats/delete/:id` to remove an item.
- **Back Link:** Returns user to the main page (`/`).

---

## 4. Modal Interaction

**Purpose:**  
Allows users to view saved cats in a full-screen modal and navigate through them easily.

**Behavior**

- Modal opens when a user clicks a saved image or fact.
- Keyboard navigation:
  - **Left Arrow:** View previous item
  - **Right Arrow:** View next item
  - **Escape:** Close the modal
- Modal displays either:
  - A large cat image, or
  - The text of a saved fact.

---

## 5. Delete Functionality

**Purpose:**  
Lets users remove saved cats (images or facts) from the database.

**Route:**  
`DELETE /api/cats/delete/:id`

### Behavior

- When a user clicks “Delete,” the frontend sends a request to delete the item by its unique ID.
- The server removes the record from the `saved_cats` table.
- The saved cats list refreshes automatically to show updated results.
