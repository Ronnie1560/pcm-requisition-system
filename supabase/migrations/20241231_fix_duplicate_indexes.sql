-- =====================================================
-- Fix Duplicate Indexes - Performance Optimization
-- Date: 2024-12-31
-- Issue: Duplicate indexes waste space and slow down writes
-- =====================================================

-- Drop duplicate index on user_project_assignments
-- Keep idx_user_project_assignments_project (more descriptive name)
-- Drop idx_user_assignments_project (duplicate)
DROP INDEX IF EXISTS idx_user_assignments_project;

-- Verify: Check for remaining duplicate indexes
SELECT
  schemaname,
  tablename,
  indexname,
  indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND tablename = 'user_project_assignments'
ORDER BY indexname;
