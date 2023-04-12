library endpoint;

const getAccountMe = "/accounts/me";
const getCategories = "/app/categories";
const getHomepage = "/app";
const getProductDetail = "/app/products/{id}";
const getVendorDetail = "/app/vendors/{id}";
const getCart = "/cart?page={page}&limit={limit}";
const getPaginateCart = "/cart/paginate?limit={limit}&page={page}";
const deleteCart = "/cart/{id}";
const login = "/auth/login";
const locationProvince = "/locations/provinces";
const locationDistrict = "/locations/provinces/{id}/districts";
const locationWard = "/locations/districts/{id}/wards";
const address = "/address";
const deleteAddress = "/address/{id}";
const checkout = "/order/checkout";
const getCheckout = "/order/checkout?s={s}&f={f}";
const getCategorieProductList =
    "/app/categories/{id}/products?limit={limit}&page={page}&minPrice={minPrice}&maxPrice={maxPrice}&location={location}&brands={brands}&rating={rating}&order={order}&sortBy={sortBy}";
const vouchers =
    "/vouchers?page={page}&limit={limit}&type={type}&vendorId={vendorId}";
const preVoucher = "/order/pre-voucher?s={s}&f={f}";
const order = "/order?s={s}&f={f}";
const listingOrder = "/order/listing?page={page}&limit={limit}&status={status}";
const getProductsList =
    "/products/search?limit={limit}&page={page}&priceMax={priceMax}&priceMin={priceMin}&location={location}&brands={brands}&t={text}&cat={cat}&rating={rating}";
const getFilterOptions = "/products/filters?t={text}";
const totalCart = "/cart/total";
const register = "/auth/register";
const registerOtp = "/auth/register-otp";
const verifyRegisterOtp = "/auth/verify-register-otp";
const createPass = "/auth/create-password?phone={phone}";
const loginOtp = "/auth/login-otp";
const verifyLoginOtp = "/auth/verify-login-otp";
const logout = "/accounts/logout";
const cancelOrder = "/order/{id}/cancel";
const buyNow = "/cart/buy-now";
const orderDetail = "/app/customer/{orderId}";
const shipmentDetails = "/app/customer/{orderId}/shipmentDetail";
