function fetchData() {
      try {
        const response = await fetch('http://localhost:5000/api/v1/category/percentage');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
	      x=data;
        return data; // Assign the fetched data to the variable x
        console.log('Fetched data:', x); // Log the data to the console
      } catch (error) {
        console.error('There was a problem with the fetch operation:', error);
      }
    }
x=fetchData();
console.log(x);
