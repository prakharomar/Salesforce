let user = {
  name: "Prakhar",
  address: {
    street: "Main",
    city: "Paris"
  }
}
// traditional way, checking each property
let street = user && user.address && user.address.street

// with optional chaining
let streetChaining = user?.address?.street;
