class Product {
  final String id;
  final String brand;
  final String title;
  final String imageUrl;
  final double rating;
  final String reviewsCount;
  final double price;
  final String badgeText;

  const Product({
    required this.id,
    required this.brand,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.badgeText,
  });
}

// Dummy list for your development and testing
final List<Product> mockProducts = [
  const Product(
    id: '1',
    brand: 'AURA',
    title: 'Echo Sphere Smart Hub',
    imageUrl: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?q=80&w=500',
    rating: 4.2,
    reviewsCount: '3.2k',
    price: 129.00,
    badgeText: 'FAST DELIVERY',
  ),
  const Product(
    id: '2',
    brand: 'LUMINA',
    title: 'Minimalist Desk Lamp 2.0',
    imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?q=80&w=500',
    rating: 4.8,
    reviewsCount: '1.5k',
    price: 89.99,
    badgeText: 'FREE SHIPPING',
  ),
  const Product(
    id: '3',
    brand: 'KRONOS',
    title: 'Aura Premium Smart Watch',
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=500',
    rating: 4.5,
    reviewsCount: '840',
    price: 249.00,
    badgeText: 'FAST DELIVERY',
  ),
  const Product(
    id: '4',
    brand: 'VELOCITY',
    title: 'Cloud Walker V2 Premium Sneakers',
    imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=500',
    rating: 4.9,
    reviewsCount: '2.1k',
    price: 145.00,
    badgeText: 'FAST DELIVERY',
  ),
  const Product(
    id: '5',
    brand: 'ARTISAN',
    title: 'Ribbed Glass Set (4 Pieces)',
    imageUrl: 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?q=80&w=500',
    rating: 4.7,
    reviewsCount: '920',
    price: 64.00,
    badgeText: 'FREE SHIPPING',
  ),
  const Product(
    id: '6',
    brand: 'NORDIC',
    title: 'Sleek Leather Laptop Portfolio Case',
    imageUrl: 'https://images.unsplash.com/photo-1544816155-12df9643f363?q=80&w=500',
    rating: 5.0,
    reviewsCount: '410',
    price: 120.00,
    badgeText: 'FAST DELIVERY',
  ),
  const Product(
    id: '8',
    brand: 'MERIDIAN',
    title: 'Classic Matte Black Sunglasses',
    imageUrl: 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?q=80&w=500',
    rating: 4.4,
    reviewsCount: '630',
    price: 115.00,
    badgeText: 'FREE SHIPPING',
  ),
];