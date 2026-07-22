class Product {
  final String id;
  final String brand;
  final String category;
  final String title;
  final String imageUrl;
  final double rating;
  final String reviewsCount;
  final double price;
  final String badgeText;

  const Product({
    required this.id,
    required this.brand,
    required this.category,
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
  // --- ELECTRONICS ---
  const Product(
    id: '1',
    category: 'electronics',
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
    category: 'electronics',
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
    category: 'electronics',
    brand: 'KRONOS',
    title: 'Aura Premium Smart Watch',
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=500',
    rating: 4.5,
    reviewsCount: '840',
    price: 249.00,
    badgeText: 'FAST DELIVERY',
  ),

  // --- FASHION ---
  const Product(
    id: '6',
    category: 'fashion',
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
    category: 'fashion',
    brand: 'MERIDIAN',
    title: 'Classic Matte Black Sunglasses',
    imageUrl: 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?q=80&w=500',
    rating: 4.4,
    reviewsCount: '630',
    price: 115.00,
    badgeText: 'FREE SHIPPING',
  ),
  const Product(
    id: '9',
    category: 'fashion',
    brand: 'URBAN',
    title: 'Overbalanced Cotton Blend Hoodie',
    imageUrl: 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?q=80&w=500',
    rating: 4.6,
    reviewsCount: '1.1k',
    price: 75.00,
    badgeText: 'FAST DELIVERY',
  ),

  // --- BEAUTY ---
  const Product(
    id: '10',
    category: 'beauty',
    brand: 'GLOW',
    title: 'Hydrating Botanical Facial Serum',
    imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=500',
    rating: 4.8,
    reviewsCount: '1.9k',
    price: 48.00,
    badgeText: 'FREE SHIPPING',
  ),
  const Product(
    id: '11',
    category: 'beauty',
    brand: 'BOTANICA',
    title: 'Organic Rosewater Toner Spray',
    imageUrl: 'https://images.unsplash.com/photo-1608248597262-838029969019?q=80&w=500',
    rating: 4.7,
    reviewsCount: '750',
    price: 32.00,
    badgeText: 'FAST DELIVERY',
  ),
  const Product(
    id: '12',
    category: 'beauty',
    brand: 'LUMIÈRE',
    title: 'Velvet Matte Longwear Lipstick',
    imageUrl: 'https://images.unsplash.com/photo-1586495777744-4413f21062fa?q=80&w=500',
    rating: 4.5,
    reviewsCount: '2.4k',
    price: 26.00,
    badgeText: 'FREE SHIPPING',
  ),

  // --- SHOES ---
  const Product(
    id: '4',
    category: 'shoes',
    brand: 'VELOCITY',
    title: 'Cloud Walker V2 Premium Sneakers',
    imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=500',
    rating: 4.9,
    reviewsCount: '2.1k',
    price: 145.00,
    badgeText: 'FAST DELIVERY',
  ),
  const Product(
    id: '13',
    category: 'shoes',
    brand: 'STRIDE',
    title: 'Retro High Top Leather Sneakers',
    imageUrl: 'https://images.unsplash.com/photo-1552346154-21d32810aba3?q=80&w=500',
    rating: 4.6,
    reviewsCount: '1.3k',
    price: 130.00,
    badgeText: 'FREE SHIPPING',
  ),
  const Product(
    id: '14',
    category: 'shoes',
    brand: 'TRAIL',
    title: 'All-Terrain Outdoor Running Shoes',
    imageUrl: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?q=80&w=500',
    rating: 4.7,
    reviewsCount: '890',
    price: 160.00,
    badgeText: 'FAST DELIVERY',
  ),

  // --- MUSIC ---
  const Product(
    id: '15',
    category: 'music',
    brand: 'SONIC',
    title: 'Active Noise Cancelling Headphones',
    imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=500',
    rating: 4.9,
    reviewsCount: '4.5k',
    price: 199.00,
    badgeText: 'FAST DELIVERY',
  ),
  const Product(
    id: '16',
    category: 'music',
    brand: 'RESONANCE',
    title: 'Portable Waterproof Bluetooth Speaker',
    imageUrl: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?q=80&w=500',
    rating: 4.6,
    reviewsCount: '1.8k',
    price: 85.00,
    badgeText: 'FREE SHIPPING',
  ),
  const Product(
    id: '17',
    category: 'music',
    brand: 'VINTAGE',
    title: 'Wood Grain Turntable Vinyl Player',
    imageUrl: 'https://images.unsplash.com/photo-1539375665275-f9de415ef9ac?q=80&w=500',
    rating: 4.8,
    reviewsCount: '620',
    price: 175.00,
    badgeText: 'FAST DELIVERY',
  ),
];